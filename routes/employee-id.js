const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');

const router = new Router();
module.exports = router;

/**
 * @api {get} /employee/:id Get employee details
 * @apiName GetEmployeeDetails
 * @apiGroup Employee
 * @apiDescription Returns the employee with the given id's details
 * 
 * @apiParam {Number}     id  Employee's ID number
 * 
 * @apiSuccess {Object[]} rows                  Results from the database. Returns information from tables:
 *                                              employee,
 *                                              employee_address, 
 *                                              job,
 *                                              department,
 *                                              benefits,
 *                                              salary
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "employee_id": 1000000,
 *                ...
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
      const joinArgs = [
        'employee',
        'NATURAL JOIN employee_address',
        'NATURAL JOIN job',
        'NATURAL JOIN department',
        'NATURAL JOIN benefits',
        'NATURAL JOIN salary',
      ];
      const dbQuery = format('SELECT *\nFROM %I e\n\t%s\n\t%s\n\t%s\n\t%s\n\t%s;', ...joinArgs);
      const result = await db.query(dbQuery); 
      res.json({
        rows: result.rows, 
        queries: [dbQuery],
        transaction: false
      });
    } catch(err) {
      console.error(err.stack);
      res.status(422).json({
        error: err.message,
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
