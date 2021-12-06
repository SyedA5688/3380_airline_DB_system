const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');
const utils = require('../route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {get} /department Get all departments
 * @apiName GetAllDepartments
 * @apiGroup Departments
 * @apiDescription Returns department information.

 * @apiQuery {String {non-empty}}                   [q]             Filter rows based on query
 * @apiQuery {String=id,name,date}                  [searchBy=name] Used if <code>q</code> is specified.
 * @apiQuery {Number {1+}}                          [page=1]        Specify <code>page</code> if there are more results than <code>limit</code>
 * @apiQuery {String=id,name,date,jobs,employees}   [sort=id]       How rows are sorted
 * @apiQuery {String=asc,desc}                      [order=asc]     Receive rows in ascending or descending order
 * @apiQuery {Number {1-100}}                       [limit=10]      The maximum number of rows to receive
 * 
 * @apiSuccess {Object[]} rows                      Results from the database
 * @apiSuccess {Number}   rows.job_count            Number of jobs in department
 * @apiSuccess {Number}   rows.employee_count       Number of employees in department
 * @apiSuccess {Number}   rows.department_id        Department ID
 * @apiSuccess {String}   rows.department_name      Department name
 * @apiSuccess {String}   rows.creation_date        Date department was created
 * @apiSuccess {Number}   rows.department_head_id   Department head ID
 * @apiSuccess {String}   rows.first_name           Department head's first name
 * @apiSuccess {String}   [rows.m_initial]          Department head's middle initial
 * @apiSuccess {String}   rows.last_name            Department head's last name
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "job_count": 5,
 *                "employee_count": 100,
 *                "department_id": 123,
 *                "department_name": "SALES",
 *                "creation_date": "2000-09-17",
 *                "department_head_id": 1000000,
 *                "first_name": "JOHN",
 *                "m_initial": "K",
 *                "last_name": "SMITH"
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 */
router.get('/department', async (req, res) => {
  const params = req.query; 
  const sortParams = {
    id: 'department_id',
    name: 'department_name',
    date: 'creation_date',
    jobs: 'job_count',
    employees: 'employee_count'
  };

  // Filtering logic
  const query = params.q && params.q.toString().trim() !== '' ? params.q.toString().trim().toUpperCase() : '';
  let filterString = '';
  if(query){
    const searchBy = params.searchBy && sortParams[params.searchBy] ? sortParams[params.searchBy] : sortParams.name;
    if(searchBy === sortParams.name) filterString = format('WHERE %I LIKE \'%%%s%%\'\n', searchBy, query);
    else if(searchBy !== sortParams.jobs || searchBy !== sortParams.employees) filterString = format('WHERE d.%I = %L\n', searchBy, query);
    else filterString = format('WHERE %I = %L\n', searchBy, query);
  }
  // Arguments used to create sql query
  const columnArgs = [ 
    'department_id',
    'department_name',
    'creation_date',
    'department_head_id',
    'first_name',
    'm_initial',
    'last_name'
  ];
  const joinArgs = [
    'department',
    'job',
    'department_id',
    'employee',
    'job_id',
    'employee_id',
    'department_head_id'
  ];
  const orderString = utils.orderingParams(params, sortParams, 'name');
  const columnString = format('d.%I,%I,%I,%I,h.%I,h.%I,h.%I', ...columnArgs);
  const joinString = format('FROM %I d\n\tLEFT JOIN %I j\n\tON j.%3$I = d.%3$I\n\tLEFT JOIN %I e\n\tON e.%5$I = j.%5$I\n\tLEFT JOIN %4$I h\n\tON h.%6$I = d.%I', ...joinArgs);
  
  const queryString = `SELECT COUNT(DISTINCT j.%I) AS job_count,COUNT(DISTINCT e.%I) AS employee_count,${columnString}\n${joinString}\n`;
  const dbQuery = format(queryString, 'job_id', 'employee_id') + `${filterString}GROUP BY ${columnString}\n${orderString};`;
  try {
    const result = await db.query(dbQuery, '-- Get departments\n');
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
 * @api {post} /department Create new department
 * @apiName AddNewDepartment
 * @apiGroup Departments
 * @apiDescription Attempts to insert a new department into the database. Returns the inserted department.
 * 
 * @apiBody {String=a-z}  department_name      Department name
 * @apiBody {String}      creation_date        Date department was created
 * @apiBody {Number}      department_head_id   Department head ID
 * 
 * @apiSuccess {Object[]} rows                      Results from the database
 * @apiSuccess {Number}   rows.department_id        Department ID
 * @apiSuccess {String}   rows.department_name      Department name
 * @apiSuccess {String}   rows.creation_date        Date department was created
 * @apiSuccess {Number}   rows.department_head_id   Department head ID
 * @apiSuccess {String}   rows.first_name           Department head's first name
 * @apiSuccess {String}   [rows.m_initial]          Department head's middle initial
 * @apiSuccess {String}   rows.last_name            Department head's last name
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "department_id": 123,
 *                "department_name": "SALES",
 *                "creation_date": "2000-09-17",
 *                "department_head_id": 1000000,
 *                "first_name": "JOHN",
 *                "m_initial": "K",
 *                "last_name": "SMITH"
 *               }],
 *      "queries": ["INSERT INTO table VALUES(...);"],
 *      "transaction": true
 *    }
 */
router.post('/department', async (req, res) => {
  // TODO: input validation
  const body = req.body;
  // Check required fields exist
  const requiredFields = ['department_name', 'creation_date', 'department_head_id'];
  if(utils.checkRequiredFields(requiredFields, body)) {
    Object.keys(body).forEach((key) => {
      body[key] = body[key].toString().trim().toUpperCase();
    });

    const client = await db.connect().catch((err) => utils.connectionError(err, res));
    if(client) {
      let queries = [];
      try {
        await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Create new department\n');
        await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

        const params = utils.getParameters(requiredFields, [], body);
        let query = format('INSERT INTO %I (%I)\nVALUES (%L)\nRETURNING %I;', 'department', params.names, params.values, 'department_id');
        const department_id = (await utils.transacQuery(queries, client, query)).rows[0].department_id;

        await utils.transacQuery(queries, client, 'COMMIT;');
        await utils.transacQuery(queries, client, 'END TRANSACTION;\n');
        client.release();

        // Arguments used to create sql query
        const columnArgs = [ 
          'department_id',
          'department_name',
          'creation_date',
          'department_head_id',
          'first_name',
          'm_initial',
          'last_name'
        ];
        const joinArgs = [
          'department',
          'employee',
          'department_head_id',
          'employee_id'
        ];
        const queryString = `SELECT %I\nFROM %I\n\tLEFT JOIN %I\n\tON %I = %I\nWHERE %I = %L;`;
        const dbQuery = format(queryString, columnArgs, ...joinArgs, 'department_id', department_id);
        const result = await db.query(dbQuery);
        res.json({
          rows: result.rows,
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
    res.status(422).json({
      error: 'Missing required fields',
      requiredFields: requiredFields,
      queries: [],
      transaction: false
    });
  }
});
