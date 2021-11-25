const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');

const router = new Router();
module.exports = router;

/**
 * @api {get} /employee/:id Get employee personal details
 * @apiName GetEmployeePersonal
 * @apiGroup Employee
 * @apiDescription Returns the employee with the given id's personal details
 * 
 * @apiParam {Number}     id  Employee's ID number
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.employee_id      Employee's ID number
 * @apiSuccess {String}   rows.first_name       First name
 * @apiSuccess {String}   [rows.m_initial]      Middle initial (can be null)
 * @apiSuccess {String}   rows.last_name        Last name
 * @apiSuccess {String}   rows.dob              Date of birth
 * @apiSuccess {String}   rows.gender           Gender, M = Male, F = Female, O = Other
 * @apiSuccess {String}   [rows.phone]          Phone Number
 * @apiSuccess {String}   [rows.email]          Email address
 * @apiSuccess {String}   [rows.ssn]            Social Security Number
 * 
 * @apiSuccess {String}   rows.street_address   Street address
 * @apiSuccess {String}   rows.city             City
 * @apiSuccess {String}   rows.country          Country or region
 * @apiSuccess {String}   [rows.zip_code]       Zip code (US) or postal code
 * @apiSuccess {String}   [rows.state]          State or province
 * 
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
 *                "dob": "1950-08-13",
 *                "gender": "M",
 *                "phone": "+15559995555",
 *                "email": "john@example.com",
 *                "ssn": "123456789",
 *                "street_address": "123 ABC STREET",
 *                "city": "NEW YORK CITY",
 *                "country": "UNITED STATES",
 *                "zip_code": "12345",
 *                "state": "NY"
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 * 
 */
router.get('/employee/:id', async (req, res) => {
  const id = req.params.id;
  if(id && /^\d+$/.test(id)) {
    try {
      let queries = [];
      let args = [
        'column_name',
        'information_schema.columns',
        'address_id',
        'job_id',
        'table_name',
        'employee',
        'employee_address'
      ];
      let dbQuery = format('SELECT %I\nFROM %s\nWHERE NOT (%1$I = %3$L OR %1$I = %4$L)\n\tAND (%5$I = %6$L OR %5$I = %7$L);', ...args);
      queries.push(dbQuery);
      let result = (await db.query(dbQuery)).rows; // Get column names from schema
      let columnArgs = [];
      result.forEach((column) => {
        columnArgs.push(column.column_name);
      });
      args = [
        'employee',
        'employee_address',
        'address_id',
        'employee_id'
      ];
      dbQuery = format('SELECT %I\nFROM %I e\n\tJOIN %I a\n\tON e.%4$I = a.%4$I\nWHERE %I = %L;', columnArgs, ...args, id);
      queries.push(dbQuery);
      result = await db.query(dbQuery);
      res.json({
        rows: result.rows, 
        queries: queries,
        transaction: false
      });
    } catch(err) {
      console.error(err.stack);
      res.status(422).json({
        error: err.message,
        queries: queries,
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