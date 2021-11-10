const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');

const router = new Router();
module.exports = router;

// Get all employees currently in database
router.get('/employees', async (req, res) => {
  const args = ['employee', 'LIMIT 100'];
  const dbQuery = format.withArray('SELECT *\nFROM %I\n%s;\n', args);
  try {
    const result = await db.query(dbQuery);
    res.json(result.rows);
  } catch(err) {
    console.error(err.stack);
    res.json({error: 'invalid query'});
  }
});

// Insert a new employee into the ElephantSQL employee database
router.post('/employees', async (req, res) => {
  const {id, first_name, last_name, job_title, salary} = req.body;
  const dbQuery = format('INSERT INTO %I VALUES($1, $2, $3, $4, $5)\nRETURNING *;\n', 'employee');
  try {
    const result = await db.query(dbQuery, [id, first_name, last_name, job_title, salary]);
    res.json(result.rows[0]);
  } catch(err) {
    console.error(err.stack);
    res.json({error: 'invalid query'});
  }
});
