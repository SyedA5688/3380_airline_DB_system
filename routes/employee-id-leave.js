const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');
const utils = require('./route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {get} /employee/:id Get employee leave details
 * @apiName GetEmployeeLeave
 * @apiGroup Employees
 * @apiDescription Returns the employee with the given id's leave details.
 * 
 * @apiParam {Number}     id  Employee's ID number
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.leave_id         Leave ID
 * @apiSuccess {Number}   rows.employee_id      Employee ID
 * @apiSuccess {String}   rows.date             Date issued
 * @apiSuccess {String}   rows.reason           Reason for leave
 * @apiSuccess {String}   rows.status           Status of leave
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "leave_id": "123",
 *                "employee_id": "1000000",
 *                "date": "2010-05-05",
 *                "reason": "MEDICAL",
 *                "status": "APPROVED"
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 * 
 */
 router.get('/employee/:id/leave', async (req, res) => {
  const id = req.params.id;
  if(id && /^\d+$/.test(id)) {
    const args = [
      'leave',
      'employee_id',
      id
    ];
    const dbQuery = format('SELECT *\nFROM %I\nWHERE %I = %L;', ...args);
    try {
      const result = await db.query(dbQuery); 
      res.json({
        rows: result.rows, 
        queries: [dbQuery],
        transaction: false
      });
    } catch {
      console.error(err.stack);
      res.status(422).json({
        error: err.message,
        queries: [dbQuery],
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

/**
 * @api {post} /employee/:id Create new leave for employee
 * @apiName AddNewLeave
 * @apiGroup Employees
 * @apiDescription Attempts to insert a new leave report for an employee. Returns the inserted leave report.
 * 
 * @apiParam  {Number}         id       Employee's ID number
 * @apiBody   {String}         date     Date issued
 * @apiBody   {String=[a-z]}   reason   Reason for leave
 * @apiBody   {String=[a-z]}   status   Status of leave
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.leave_id         Leave ID
 * @apiSuccess {Number}   rows.employee_id      Employee ID
 * @apiSuccess {String}   rows.date             Date issued
 * @apiSuccess {String}   rows.reason           Reason for leave
 * @apiSuccess {String}   rows.status           Status of leave
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "leave_id": "123",
 *                "employee_id": "1000000",
 *                "date": "2010-05-05",
 *                "reason": "MEDICAL",
 *                "status": "APPROVED"
 *               }],
 *      "queries": ["INSERT INTO table VALUES (...);"],
 *      "transaction": true
 *    }
 * 
 */
 router.post('/employee/:id/leave', async (req, res) => {
  const id = req.params.id;
  if(id && /^\d+$/.test(id)) {
    const body = req.body;
    const requiredFields = ['date', 'reason', 'status'];
    if(utils.checkRequiredFields(requiredFields, body)) {
      Object.keys(body).forEach((key) => {
        if(key !== 'date') body[key] = body[key].toString().trim().toUpperCase();
      });

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

          const params = utils.getParameters(requiredFields, [], body);
          const dbQuery = format('INSERT INTO %I (%I,%I)\nVALUES (%L,%L)\nRETURNING *;',
            'leave', 'employee_id', params.names, id, params.values);
          const result = await transacQuery(queries, client, dbQuery);

          await transacQuery(queries, client, 'COMMIT;');
          await transacQuery(queries, client, 'END TRANSACTION;\n');
          client.release();
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
  } else {
    res.status(400).json({
      error: 'Invalid or missing id',
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