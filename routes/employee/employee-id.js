const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');

const utils = require('../route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {get} /employee/:id Get employee details
 * @apiName GetEmployeeDetails
 * @apiGroup Employees
 * @apiDescription Returns the employee with the given id's details
 * 
 * @apiParam {Number}     id  Employee's ID number
 * 
 * @apiSuccess {Object[]} rows                  Results from the database. Returns information from tables:
 *                                              employee,
 *                                              employee_address, 
 *                                              job,
 *                                              department,
 *                                              benefits,
 *                                              salary
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "employee_id": 1000000,
 *                ...
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 * 
 */
router.get('/employee/:id', async (req, res) => {
  const id = req.params.id;
  if(id && /^\d+$/.test(id)) {
    const joinArgs = [
      'employee',
      'NATURAL JOIN employee_address',
      'NATURAL JOIN job',
      'NATURAL JOIN department',
      'NATURAL JOIN benefits',
      'NATURAL JOIN salary'
    ];
    const dbQuery = format('SELECT *\nFROM %I e\n\t%s\n\t%s\n\t%s\n\t%s\n\t%s\nWHERE %I = %L;', ...joinArgs, 'employee_id', id);
    try {
      const result = await db.query(dbQuery); 
      res.json({
        rows: result.rows, 
        queries: [dbQuery],
        transaction: false
      });
    } catch(err) {
      console.error(err.stack);
      res.status(422).json({
        error: err.message,
        queries: [dbQuery],
        transaction: false
      });
    }
  } else {
    res.status(400).json({
      error: 'Invalid or missing id',
      queries: [],
      transaction: false
    });
  }
});

/**
 * @api {put} /employee/:id Change employee details
 * @apiName ChangeEmployeeDetails
 * @apiGroup Employees
 * @apiDescription Attempts to alter employee details based on body parameters. 
 * Returns the employee's id on success.
 * 
 * @apiParam  {Number}  id  Employee's ID number
 * 
 * @apiBody {String {non-empty}=A-Z}    [first_name] First name
 * @apiBody {String {1 character}=A-Z}  [m_initial]  Middle initial
 * @apiBody {String {non-empty}=A-Z}    [last_name]  Last name
 * @apiBody {String=M,F,O}              [gender]     M = Male, F = Female, O = Other
 * @apiBody {String}                    [dob]        Date of birth
 * @apiBody {String {9 characters}=0-9} [ssn]        Social Security Number
 * @apiBody {String=+,0-9}              [phone]      Phone number using E.164 standard
 * @apiBody {String{...100}}            [email]      Email address
 * @apiBody {Number}                    [job_id]     Job ID for employee. If id does not exist, employee will have job_id of 0 (unassigned).
 * @apiBody {Number}                    [manager_id] The employee's manager's ID
 * 
 * @apiBody {String {non-empty}=0-9,A-Z,/,#,-,.,\,} [street_address]  Street address
 * @apiBody {String {non-empty}=A-Z}                [city]            City
 * @apiBody {String {non-empty}=A-Z}                [country]         Country or region
 * @apiBody {String {non-empty}=0-9,A-Z}            [zip_code]        Zip-code (US) or postal code
 * @apiBody {String {non-empty}=A-Z}                [state]           State or province
 *         
 * @apiBody {String=[0-9].[0-9]} [hourly_wage]  Hourly wage
 * @apiBody {String=[0-9].[0-9]} [annual_bonus] Annual bonus
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.employee_id      Employee's ID number
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "employee_id": 1000000
 *               }],
 *      "queries": ["UPDATE table\nSET column\nWHERE employee_id = 1000000;"],
 *      "transaction": true
 *    }
 * 
 */
router.put('/employee/:id', async (req, res) => {
  const id = req.params.id;
  if(id && /^\d+$/.test(id)) {
    const body = req.body;
    if(body['employee_id'] || body['address_id'] || body['salary_id']) {
      res.status(403).json({
        error: 'Cannot modify blacklisted attributes',
        blacklist: ['employee_id', 'address_id', 'salary_id'],
        queries: [],
        transaction: false
      });
    } else {
      const params = utils.separateFields(['employee', 'employee_address', 'salary'], body);
      // Check params isn't empty
      if(!utils.isEmpty(params['employee']) || !utils.isEmpty(params['employee_address']) || !utils.isEmpty(params['salary'])) {
        const client = await db.connect().catch((err) => {
          console.log(err.stack);
          res.status(422).json({
            error: 'Error connecting to database',
            queries: [],
            transaction: false
          });
        });
        if(client) {
          let queries = [];
          try {
            await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;');
            await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');
            // Check employee exists first
            const query = format('SELECT %1$I\nFROM %I\nWHERE %1$I = %3$L;', 'employee_id', 'employee', id);
            if(!(await utils.transacQuery(queries, client, query)).rows.length) throw new Error('ID not found!');
            // Modifying employee
            if(!utils.isEmpty(params['employee'])) {
              let updateString = '';
              if(params['employee'].phone && params['employee'].phone.trim().charAt(0) !== '+') params['employee'].phone = '+1' + params['employee'].phone.trim(); // Just for demo purposes
              Object.keys(params['employee']).forEach((key) => {
                if(key !== 'email') params['employee'][key] = params['employee'][key].toString().trim().toUpperCase();
                if(!params['employee'][key]) throw new Error(`${key} is empty!`);
                updateString += `\t${key} = '${params['employee'][key]}',\n`;
              });
              updateString = updateString.substring(0, updateString.length - 2);
              const args = [
                'employee',
                updateString,
                'employee_id',
                id
              ];
              const dbQuery = format('UPDATE %I\nSET\n%s\nWHERE %I = %L;', ...args);
              await utils.transacQuery(queries, client, dbQuery);
            }
            // Modifying employee address
            if(!utils.isEmpty(params['employee_address'])) {
              let args = [
                'address_id',
                'employee',
                'employee_id',
                id
              ];
              let dbQuery = format('SELECT %I\nFROM %I\nWHERE %I = %L;', ...args); 
              const address_id = (await utils.transacQuery(queries, client, dbQuery)).rows[0].address_id;

              let updateString = '';
              Object.keys(params['employee_address']).forEach((key) => {
                params['employee_address'][key] = params['employee_address'][key].toString().trim().toUpperCase();
                if(!params['employee_address'][key]) throw new Error(`${key} is empty!`);
                updateString += `\t${key} = '${params['employee_address'][key]}',\n`;
              });
              updateString = updateString.substring(0, updateString.length - 2);

              args = [
                'employee_address',
                updateString,
                'address_id',
                address_id
              ];
              dbQuery = format('UPDATE %I\nSET\n%s\nWHERE %I = %L;', ...args);
              await utils.transacQuery(queries, client, dbQuery);
            }
            // Modifying salary
            if(!utils.isEmpty(params['salary'])) {
              let updateString = '';
              Object.keys(params['salary']).forEach((key) => {
                params['salary'][key] = params['salary'][key].toString().trim();
                if(!params['salary'][key]) throw new Error(`${key} is empty!`);
                updateString += `\t${key} = '${params['salary'][key]}',\n`;

              });
              updateString = updateString.substring(0, updateString.length - 2);
              const args = [
                'salary',
                updateString,
                'employee_id',
                id
              ];
              const dbQuery = format('UPDATE %I\nSET\n%s\nWHERE %I = %L;', ...args);
              await utils.transacQuery(queries, client, dbQuery);
            }
            await utils.transacQuery(queries, client, 'COMMIT;');
            await utils.transacQuery(queries, client, 'END TRANSACTION;\n');
            client.release();
            res.json({
              rows: [{'employee_id': id}],
              queries: queries,
              transaction: true
            });
          } catch(err) {
            console.log(err.stack);
            await utils.transacQuery(queries, client, 'ROLLBACK;\n');
            client.release();
            res.status(422).json({
              error: err.message,
              queries: queries,
              transaction: true
            });
          }
        } 
      } else {
        res.status(400).json({
          error: 'Empty body',
          queries: [],
          transaction: false
        });
      }
    }
  } else {
    res.status(400).json({
      error: 'Invalid or missing id',
      queries: [],
      transaction: false
    });
  }
});
