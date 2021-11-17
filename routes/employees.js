/* 
 * GET QUERY PARAMATERS:
 * page:   int                                    default = 1
 * sort:   [id | fname | lname | salary* | job*]  default = id    *not implemented
 * limit:  int                                    default = 100
 * 
 * SUMMARY:
 * Returns the first 100 employees sorted by id (default).
 * 
 * POST BODY PARAMETERS:
 * {id, first_name, last_name, job_title, salary}
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
const params = {
  tableName: 'employee',
  orderBy: 'id',
  limit: 'LIMIT 100'
};

// Get all employees currently in database
router.get('/employees', async (req, res) => {
  const args = [params.tableName, params.orderBy, params.limit];
  const dbQuery = format.withArray('SELECT *\nFROM %I\nORDER BY %I\n%s;', args);
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
      error: 'invalid query',
      queries: [dbQuery],
      transaction: false
    });
  }
});

// Insert a new employee into the ElephantSQL employee database
router.post('/employees', async (req, res) => {
  const {id, first_name, last_name, job_title, salary} = req.body;
  const args = [params.tableName, id, first_name, last_name, job_title, salary];
  const dbQuery = format.withArray('INSERT INTO %I VALUES(%L, %L, %L, %L, %L)\nRETURNING *;', args);
  try {
    const result = await db.query(dbQuery);
    res.json({
      rows: result.rows, 
      queries: [dbQuery],
      transaction: false
    });
  } catch(err) {
    console.error(err.stack);
    res.json({
      error: 'invalid query',
      queries: [dbQuery],
      transaction: false
    });
  }
});
