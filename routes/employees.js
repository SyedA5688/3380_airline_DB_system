/* 
 * GET QUERY PARAMATERS:
 * page:   int                                    default = 1
 * sort:   [id | fname | lname | salary | job]    default = id
 * order:  [asc | desc]                           default = asc
 * limit:  int                                    default = 10
 * 
 * SUMMARY:
 * Returns the first 10 employees sorted by id in ascending order (default).
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
  id: 'employee_id',
  first_name: 'first_name',
  m_initial: 'm_initial',
  last_name: 'last_name',
  ssn: 'ssn',
  dob: 'dob',
  gender: 'gender',
  phone: 'phone',
  email: 'email',
  address: 'address',
  job_id: 'job_id',
  city_id: 'city_id',
};

// Get all employees currently in database
router.get('/employees', async (req, res) => {
  // TODO: Input validation
  const params = req.query;
  const page = params.page ? params.page : 1;
  const sortBy = tableParams[params.sort] ? tableParams[params.sort] : tableParams.id;
  const order = params.order ? params.order.toUpperCase() : 'ASC';
  const limit = params.limit ? params.limit : 10;

  const args = [tableParams.table, sortBy, order, limit * (page - 1), limit];
  const dbQuery = format.withArray('SELECT *\nFROM %I\nORDER BY %I %s\nOFFSET %s\nLIMIT %s;', args);
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
