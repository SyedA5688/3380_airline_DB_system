const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');

const router = new Router();
module.exports = router;

// DBMS table information
const tableParams = require('./employee.json');

/**
 * @api {get} /employee Get all employees
 * @apiName GetEmployees
 * @apiGroup Employee
 * 
 * @apiQuery {Number {1..}}                             [page=1]    Specify <code>page</code> if there are more employees than <code>limit</code>
 * @apiQuery {String=id,fname,lname,title,department}   [sort=id]   How rows are sorted
 * @apiQuery {String=asc,desc}                          [order=asc] Receive rows in ascending or descending order
 * @apiQuery {Number {1..100}}                          [limit=10]  The maximum number of rows to receive
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.employee_id      Employee's ID number
 * @apiSuccess {String}   rows.first_name       Employee's first name
 * @apiSuccess {String}   rows.m_initial        Employee's middle initial
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
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 */
router.get('/employee', async (req, res) => {
  // TODO: Input validation
  const params = req.query;
  const page = params.page ? params.page : 1;
  const sortBy = tableParams[params.sort] ? tableParams[params.sort] : tableParams.id;
  const order = params.order ? params.order.toUpperCase() : 'ASC';
  const limit = params.limit ? (params.limit <= 100 ? params.limit : 100) : 10;

  const columnArgs = [ 
    tableParams.id, 
    tableParams.fname, 
    tableParams.minitial, 
    tableParams.lname,
    tableParams.title,
    tableParams.department
  ];
  const joinArgs = [
    tableParams.empTable,
    tableParams.jobTable,
    tableParams.depTable
  ];
  const orderArgs = [  
    sortBy, 
    order, 
    limit * (page - 1), 
    limit 
  ];
  const queryString = `SELECT %I\nFROM %I\n\tNATURAL JOIN %I\n\tNATURAL JOIN %I\nORDER BY %I %s\nOFFSET %s\nLIMIT %s;`;
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
    res.json({
      error: err.message,
      queries: [dbQuery],
      transaction: false
    });
  }
});

// Insert a new employee into the ElephantSQL employee database
// router.post('/employees', async (req, res) => {
//   const {id, first_name, last_name, job_title, salary} = req.body;
//   const args = [tableParams.empTable, id, first_name.trim().toUpperCase(), last_name.trim().toUpperCase(), job_title.trim().toUpperCase(), salary];
//   const dbQuery = format.withArray('INSERT INTO %I VALUES(%L, %L, %L, %L, %L)\nRETURNING *;', args);
  
//   try {
//     const result = await db.query(dbQuery);
//     res.json({
//       rows: result.rows, 
//       queries: [dbQuery],
//       transaction: false
//     });
//   } catch(err) {
//     console.error(err.stack);
//     res.json({
//       error: err.message,
//       queries: [dbQuery],
//       transaction: false
//     });
//   }
// });
