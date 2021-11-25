const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');

const router = new Router();
module.exports = router;

/**
 * @api {get} /employee/:id Get employee leave details
 * @apiName GetEmployeeLeave
 * @apiGroup Employee
 * @apiDescription Returns the employee with the given id's leave details
 * 
 * @apiParam {Number}     id  Employee's ID number
 * 
 * @apiSuccess {Object[]} rows                  Results from the database. Returns information from leave table
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