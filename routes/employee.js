/* 
 * GET QUERY PARAMATERS:
 * page:   int                                        default = 1
 * sort:   [id | fname | lname | title | department]  default = id
 * order:  [asc | desc]                               default = asc
 * limit:  int                                        default = 10,   max = 100
 * 
 * SUMMARY:
 * Returns the first 10 employees sorted by id in ascending order (default).
 * Returns employee first and last name, middle initial, job title, and department.
 * 
 * POST BODY PARAMETERS:
 * 
 * 
 * SUMMARY:
 * Attempts to insert a new employee into the database. Returns the inserted employee.
 */

const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');

const router = new Router();
module.exports = router;

// DBMS table information
const tableParams = require('./employee.json');

// Get all employees currently in database
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
