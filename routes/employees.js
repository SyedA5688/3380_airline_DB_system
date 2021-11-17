const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');

const router = new Router();
module.exports = router;

// Get all employees currently in database
router.get('/employees', async (req, res) => {
  const args = ['employee', 'id' ,'LIMIT 100'];
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
  const args = ['employee', id, first_name, last_name, job_title, salary];
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
