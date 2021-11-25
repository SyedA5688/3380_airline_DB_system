const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');
const utils = require('./route-utils');

const router = new Router();
module.exports = router;

// Database table information
const tableGetInfo = require('./employee-get-db.js');

/**
 * @api {get} /employee Get all employees
 * @apiName GetAllEmployees
 * @apiGroup Employee
 * @apiDescription Returns an array of objects containing basic employee information. 
 * See "Get employee details" for specific information about one employee.
 * 
 * @apiQuery {String {1-3 non-empty strings}}           [q]             Filter rows based on query. Maximum of 3 arguments
 * @apiQuery {String=id,name,title,department}          [searchBy=name] Used if <code>q</code> is specified
 * @apiQuery {Number {1+}}                              [page=1]        Specify <code>page</code> if there are more employees than <code>limit</code>
 * @apiQuery {String=id,fname,lname,title,department}   [sort=id]       How rows are sorted
 * @apiQuery {String=asc,desc}                          [order=asc]     Receive rows in ascending or descending order
 * @apiQuery {Number {1-100}}                           [limit=10]      The maximum number of rows to receive
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.employee_id      Employee's ID number
 * @apiSuccess {String}   rows.first_name       First name
 * @apiSuccess {String}   [rows.m_initial]      Middle initial (can be null)
 * @apiSuccess {String}   rows.last_name        Last name
 * @apiSuccess {String}   rows.job_title        Employee's job title
 * @apiSuccess {String}   rows.department_name  Department employee works in
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "employee_id": 1000000,
 *                "first_name": "JOHN",
 *                "m_initial": "P",
 *                "last_name": "SMITH",
 *                "job_title": "PILOT",
 *                "department_name": "LINE PERSONNEL"
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 * 
 */
router.get('/employee', async (req, res) => {
  // TODO: Input validation
  const params = req.query;
  console.log(params);
  const page = params.page ? params.page : 1;
  const sortBy = tableGetInfo[params.sort] ? tableGetInfo[params.sort] : tableGetInfo.id;
  const order = params.order ? params.order.toUpperCase() : 'ASC';
  const limit = params.limit ? Math.min(Math.max(params.limit, 1), 100) : 10;

  // Filtering logic
  const query = params.q && params.q.toString().trim() !== '' ? params.q.toString().trim().toUpperCase() : '';
  let filterString = '';
  if(query) {
    const searchBy = params.searchBy && tableGetInfo[params.searchBy] ? params.searchBy : 'name';
    switch(searchBy) {
      case 'title':
      case 'department':
        filterString = format('WHERE %I LIKE \'%s%%\'\n', tableGetInfo[searchBy], query);
        break;

      case 'id':
        filterString = format('WHERE %I = %L\n', tableGetInfo.id, query);
        break;

      case 'name':
        const words = query.split(' ');
        switch(words.length) {
          case 1:
            // Search by either first or last name
            filterString = format('WHERE %I LIKE \'%s%%\'\n', tableGetInfo.fname, words[0]); // Case 1
            filterString += format('\tOR %I LIKE \'%s%%\'\n', tableGetInfo.lname, words[0]); // Case 2
            break;
          case 2:
            // Search by either first, middle name; first, last name; or last, first name
            filterString = format('WHERE %I LIKE \'%s%%\' AND %I LIKE \'%s%%\'\n', tableGetInfo.fname, words[0], tableGetInfo.minitial, words[1]); // Case 1
            filterString += format('\tOR %I LIKE \'%s%%\' AND %I LIKE \'%s%%\'\n', tableGetInfo.fname, words[0], tableGetInfo.lname, words[1]); // Case 2
            filterString += format('\tOR %I LIKE \'%s%%\' AND %I LIKE \'%s%%\'\n', tableGetInfo.lname, words[0], tableGetInfo.fname, words[1]); // Case 3
            break;
          case 3:
            // Search by either first, middle, last name or last, middle, first name
            const args = [tableGetInfo.fname, words[0], tableGetInfo.minitial, words[1], tableGetInfo.lname, words[2]];
            filterString = format('WHERE %I LIKE \'%s%%\' AND %I LIKE \'%s%%\' AND %I LIKE \'%s%%\'\n', ...args); // Case 1
            filterString += format('\tOR %5$I LIKE \'%2$s%%\' AND %3$I LIKE \'%4$s%%\' AND %1$I LIKE \'%2$s%%\'\n', ...args); // Case 2
            break;
          default:
            // Too many parameters; Not supported
            filterString = '';
        }
        break;
      
      default:
        filterString = '';
    }
  }
  // Arguments used to create sql query
  const columnArgs = [ 
    tableGetInfo.id, 
    tableGetInfo.fname, 
    tableGetInfo.minitial, 
    tableGetInfo.lname,
    tableGetInfo.title,
    tableGetInfo.department
  ];
  const joinArgs = [
    tableGetInfo.empTable,
    tableGetInfo.jobTable,
    tableGetInfo.job_id,
    tableGetInfo.depTable,
    tableGetInfo.dep_id
  ];
  const orderArgs = [  
    sortBy, 
    order, 
    limit * (page - 1), 
    limit 
  ];
  const queryString = `SELECT %I\nFROM %I e\n\tJOIN %I j\n\tON e.%4$s = j.%4$s\n\tJOIN %I d\n\tON j.%6$s = d.%6$s\n${filterString}ORDER BY %I %s\nOFFSET %s\nLIMIT %s;`;
  const dbQuery = format(queryString, columnArgs, ...joinArgs,...orderArgs);

  try {
    const result = await db.query(dbQuery);
    res.json({
      rows: result.rows, 
      queries: [dbQuery],
      transaction: false
    });
  } 
  catch(err) {
    console.error(err.stack);
    res.status(422).json({
      error: err.message,
      queries: [dbQuery],
      transaction: false
    });
  }
});

/**
 * @api {post} /employee Add new employee
 * @apiName AddEmployee
 * @apiGroup Employee
 * @apiDescription Attempts to insert a new employee into the database. Returns the new employee's basic information.
 * 
 * @apiBody {String {non-empty}=A-Z}    first_name         First name
 * @apiBody {String {non-empty}=A-Z}    last_name          Last name
 * @apiBody {String=M,F,O}              gender             M = Male, F = Female, O = Other
 * @apiBody {String}                    dob                Date of birth
 * @apiBody {String=[0-9].[0-9]}        hourly_wage        Hourly wage
 * @apiBody {String {9 characters}=0-9} [ssn=null]         Social Security Number
 * @apiBody {String {1 character}=A-Z}  [m_initial=null]   Middle initial
 * @apiBody {String=+,0-9}              [phone=null]       Phone number using E.164 standard
 * @apiBody {String{...100}}            [email=null]       Email address
 * @apiBody {Number}                    [job_id=0]         Job ID for new employee. If id does not exist, employee will have job_id of 0 (unassigned).
 * @apiBody {Number}                    [manager_id=null]  The employee's manager's ID
 * @apiBody {Number}                    [annual_bonus=0]   Annual bonus
 * 
 * @apiBody {String {non-empty}=0-9,A-Z,/,#,-,.,\,} street_address  Street address
 * @apiBody {String {non-empty}=A-Z}                city            City
 * @apiBody {String {non-empty}=A-Z}                country         Country or region
 * @apiBody {String {non-empty}=0-9,A-Z}            [zip_code]      Zip-code (US) or postal code
 * @apiBody {String {non-empty}=A-Z}                [state]         State or province
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.employee_id      Employee's ID number
 * @apiSuccess {String}   rows.first_name       Employee's first name
 * @apiSuccess {String}   [rows.m_initial]      Employee's middle initial (can be null)
 * @apiSuccess {String}   rows.last_name        Employee's last name
 * @apiSuccess {String}   rows.job_title        Employee's job title
 * @apiSuccess {String}   rows.department_name  Department employee works in
 * @apiSuccess {String[]} queries     Array of queries used
 * @apiSuccess {Boolean}  transaction True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "employee_id": 1000000,
 *                "first_name": "JOHN",
 *                "m_initial": "P",
 *                "last_name": "SMITH",
 *                "job_title": "PILOT",
 *                "department_name": "LINE PERSONNEL"
 *               }],
 *      "queries": ["INSERT INTO table VALUES(...);", "INSERT INTO table2 VALUES(...)"],
 *      "transaction": true
 *    }
 */
router.post('/employee', async (req, res) => {
  // TODO: input validation
  const body = req.body;
  // Check required fields exist
  const requiredFields = ['first_name', 'last_name', 'dob', 'gender', 'street_address', 'city', 'country', 'hourly_wage'];
  if(utils.checkRequiredFields(requiredFields, body)) {
    Object.keys(body).forEach((key) => {
      if(key !== 'email') body[key] = body[key].toString().trim().toUpperCase();
    });
    if(body.phone && body.phone.charAt(0) !== '+') body.phone = '+1' + body.phone; // Just for demo purposes

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
        await transacQuery(queries, client, 'BEGIN TRANSACTION;');
        await transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

        const addressParams = utils.getParameters(['street_address', 'city', 'country'], ['zip_code', 'state'], body);
        let query = format('INSERT INTO %I (%I)\nVALUES (%L)\nRETURNING address_id;',
         'employee_address', addressParams.names, addressParams.values);
        body.address_id = (await transacQuery(queries, client, query)).rows[0].address_id;

        const reqArgs = ['first_name', 'last_name', 'dob', 'gender', 'address_id'];
        const optArgs = ['m_initial', 'ssn', 'phone', 'email', 'job_id', 'manager_id'];
        const employeeParams = utils.getParameters(reqArgs, optArgs, body);
        query = format('INSERT INTO %I (%I)\nVALUES (%L)\nRETURNING employee_id;',
         'employee', employeeParams.names, employeeParams.values);
        const employee_id = (await transacQuery(queries, client, query)).rows[0].employee_id;

        const salaryParams = utils.getParameters(['hourly_wage'], ['annual_bonus'], body);
        query = format('INSERT INTO %I (%I,%I)\nVALUES (%L,%L)\nRETURNING employee_id;',
         'salary', 'employee_id', salaryParams.names, employee_id, salaryParams.values);
        await transacQuery(queries, client, query);

        await transacQuery(queries, client, 'COMMIT;');
        await transacQuery(queries, client, 'END TRANSACTION;\n');
        client.release();

        const queryString = `SELECT %I\nFROM %I e\n\tJOIN %I j\n\tON e.%4$s = j.%4$s\n\tJOIN %I d\n\tON j.%6$s = d.%6$s\nWHERE employee_id = ${employee_id};`;
        const columnArgs = [ 
          tableGetInfo.id, 
          tableGetInfo.fname, 
          tableGetInfo.minitial, 
          tableGetInfo.lname,
          tableGetInfo.title,
          tableGetInfo.department
        ];
        const joinArgs = [
          tableGetInfo.empTable,
          tableGetInfo.jobTable,
          tableGetInfo.job_id,
          tableGetInfo.depTable,
          tableGetInfo.dep_id
        ];
        const dbQuery = format(queryString, columnArgs, ...joinArgs);
        const result = await db.query(dbQuery);
        queries.push(dbQuery);
        res.json({
          rows: result.rows,
          queries: queries,
          transaction: true
        });
      } catch(err) {
        console.log(err.stack);
        await transacQuery(queries, client, 'ROLLBACK;\n');
        client.release();
        res.status(422).json({
          error: err.message,
          queries: queries,
          transaction: true
        });
      }
    }
  } else {
    res.status(422).json({
      error: 'Missing required fields',
      requiredFields: requiredFields,
      queries: [],
      transaction: false
    });
  }
});

// Utility function to push query to array and query the database
const transacQuery = async (queries, client, query) => {
  queries.push(query);
  return await client.query(query);
};