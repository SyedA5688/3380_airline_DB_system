/* 
 * GET QUERY PARAMATERS:
 * page:   int                                    default = 1
 * sort:   [id | fname | lname | salary | job]    default = id
 * limit:  int                                    default = 10
 * 
 * SUMMARY:
 * Returns the first 10 employees sorted by id (default).
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
const tableParams = {
  table: 'employee',
  id: 'id',
  fname: 'first_name',
  lname: 'last_name',
  salary: 'salary',
  job: 'job'
};

// Get all employees currently in database
router.get('/employees', async (req, res) => {
  const params = req.query;
  const page = params.page ? params.page : 1;
  const sortBy = params.sort ? validateSortBy(params.sort) : tableParams.id;
  const limit = params.limit ? params.limit : 10;

  const args = [tableParams.table, sortBy, limit * (page - 1), limit];
  const dbQuery = format.withArray('SELECT *\nFROM %I\nORDER BY %I\nOFFSET %s\nLIMIT %s;', args);
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
router.post('/employees', async (req, res) => {
  const {id, first_name, last_name, job_title, salary} = req.body;
  const args = [tableParams.table, id, first_name.trim().toUpperCase(), last_name.trim().toUpperCase(), job_title.trim().toUpperCase(), salary];
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
      error: err.message,
      queries: [dbQuery],
      transaction: false
    });
  }
});

const validateSortBy = (sortBy) => {
  if(sortBy == 'fname') return tableParams.fname;
  if(sortBy == 'lname') return tableParams.lname;
  if(sortBy == 'salary') return tableParams.salary;
  if(sortBy == 'job') return tableParams.job;

  return tableParams.id; // Default
}
