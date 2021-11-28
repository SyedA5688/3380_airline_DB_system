const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');
const utils = require('./route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {get} /payroll Get all payroll entries 
 * @apiName GetAllPayrolls
 * @apiGroup Payroll
 * @apiDescription Returns all payroll entries.

 * @apiQuery {String {non-empty}} [q]             Filter rows based on query
 * @apiQuery {String=id,period}   [searchBy=id]   Used if <code>q</code> is specified.
 * @apiQuery {Number {1+}}        [page=1]        Specify <code>page</code> if there are more results than <code>limit</code>
 * @apiQuery {String=id,period}   [sort=id]       How rows are sorted
 * @apiQuery {String=asc,desc}    [order=asc]     Receive rows in ascending or descending order
 * @apiQuery {Number {1-100}}     [limit=10]      The maximum number of rows to receive
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.payroll_id       Payroll ID
 * @apiSuccess {Number}   rows.employee_id      Employee ID
 * @apiSuccess {Number}   rows.salary_id        Salary ID
 * @apiSuccess {Number}   rows.leave_id         Leave ID
 * @apiSuccess {Number}   rows.hours_worked     Hours worked by employee
 * @apiSuccess {String}   rows.pay_period       Pay period
 * @apiSuccess {Number}   rows.tax_rate         Tax rate
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "payroll_id": 123,
 *                "employee_id": 1000000,
 *                "salary_id": 321,
 *                "leave_id": 100,
 *                "hours_worked": 42,
 *                "pay_period": "2021-11-01"
 *                "tax_rate": 0.10
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 * 
 */
router.get('/payroll', async (req, res) => {
  const params = req.query;
  const page = params.page ? params.page : 1;
  const sortParams = {
    id: 'payroll_id',
    period: 'pay_period'
  };
  const sortBy = sortParams[params.sort] ? sortParams[params.sort] : sortParams.id;
  const order = params.order ? params.order.toUpperCase() : 'ASC';
  const limit = params.limit ? Math.min(Math.max(params.limit, 1), 100) : 10;

  // Filtering logic
  const query = params.q && params.q.toString().trim() !== '' ? params.q.toString().trim().toUpperCase() : '';
  let filterString = '';
  if(query){
    const searchBy = params.searchBy && sortParams[params.searchBy] ? sortParams[params.searchBy] : sortParams.id;
    filterString = format('WHERE %I = %L\n', searchBy, query);
  }

  const orderArgs = [  
    sortBy, 
    order, 
    limit * (page - 1), 
    limit 
  ];
  const queryString = `SELECT *\nFROM %I\n${filterString}ORDER BY %I %s\nOFFSET %s\nLIMIT %s;`;
  const dbQuery = format(queryString, 'payroll',...orderArgs);
  try {
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
      queries: [dbQuery],
      transaction: false
    });
  }
});

router.post('/payroll', async (req, res) => {

});

router.get('/payroll/:id', async (req, res) => {

});