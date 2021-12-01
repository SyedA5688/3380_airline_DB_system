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

 * @apiQuery {String {non-empty}}                   [q]                 Filter rows based on query
 * @apiQuery {String=id,period,employee,income}     [searchBy=period]   Used if <code>q</code> is specified. <code>employee</code> searches by ID. <code>income</code> searches by gross and net income
 * @apiQuery {Number {1+}}                          [page=1]            Specify <code>page</code> if there are more results than <code>limit</code>
 * @apiQuery {String=id,period,employee,gross,net}  [sort=period]       How rows are sorted
 * @apiQuery {String=asc,desc}                      [order=asc]         Receive rows in ascending or descending order
 * @apiQuery {Number {1-100}}                       [limit=10]          The maximum number of rows to receive
 * 
 * @apiSuccess {Object[]} rows                Results from the database
 * @apiSuccess {Number}   rows.payroll_id     Payroll ID
 * @apiSuccess {Number}   rows.employee_id    Employee ID
 * @apiSuccess {Number}   rows.hours_worked   Hours worked by employee
 * @apiSuccess {String}   rows.pay_period     Pay period
 * @apiSuccess {Number}   rows.tax_rate       Tax rate
 * @apiSuccess {String}   rows.gross_income   Gross income
 * @apiSuccess {String}   rows.taxed_income   Taxed income
 * @apiSuccess {String}   rows.net_income     Net income
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
 *                "hours_worked": 42,
 *                "pay_period": "2021-11-01"
 *                "tax_rate": 0.10,
 *                "gross_income": "$3,200.00",
 *                "taxed_income": "$320.00",
 *                "net_income": "$2880.00",
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 * 
 */
router.get('/payroll', async (req, res) => {
  const params = req.query;
  const sortParams = {
    id: 'payroll_id',
    period: 'pay_period',
    employee: 'employee_id',
    gross: 'gross_income',
    net: 'net_income'
  };
  
  // Filtering logic
  const query = params.q && params.q.toString().trim() !== '' ? params.q.toString().trim().toUpperCase() : '';
  let filterString = '';
  if(query){
    if(params.searchBy === 'income') filterString = format('WHERE %I = %L\n\tOR %I = %2$L\n', sortParams.gross, query, sortParams.net);
    else if(params.searchBy && sortParams[params.searchBy]) filterString = format('WHERE %I = %L\n', sortParams[params.searchBy], query);
    else filterString = format('WHERE %I = %L\n', sortParams.period, query);
  }

  const orderString = utils.orderingParams(params, sortParams, 'period');
  const queryString = `SELECT *\nFROM %I\n`;
  const dbQuery = format(queryString, 'payroll') + `${filterString}${orderString};`;
  try {
    const result = await db.query(dbQuery, '-- Get payroll entries\n'); 
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

/**
 * @api {post} /payroll Create a new payroll entry
 * @apiName CreatePayroll
 * @apiGroup Payroll
 * @apiDescription Attempts to insert a new payroll entry into the database. Returns the inserted entry.
 * 
 * @apiBody {Number}   employee_id      Employee ID
 * @apiBody {Number}   hours_worked     Hours worked by employee
 * @apiBody {String}   pay_period       Pay period
 * @apiBody {Number}   tax_rate         Tax rate
 * 
 * @apiSuccess {Object[]} rows                Results from the database
 * @apiSuccess {Number}   rows.payroll_id     Payroll ID
 * @apiSuccess {Number}   rows.employee_id    Employee ID
 * @apiSuccess {Number}   rows.hours_worked   Hours worked by employee
 * @apiSuccess {String}   rows.pay_period     Pay period
 * @apiSuccess {Number}   rows.tax_rate       Tax rate
 * @apiSuccess {String}   rows.gross_income   Gross income
 * @apiSuccess {String}   rows.taxed_income   Taxed income
 * @apiSuccess {String}   rows.net_income     Net income
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
 *                "hours_worked": 42,
 *                "pay_period": "2021-11-01"
 *                "tax_rate": 0.10,
 *                "gross_income": "$3,200.00",
 *                "taxed_income": "$320.00",
 *                "net_income": "$2880.00",
 *               }],
 *      "queries": ["INSERT INTO table VALUES(...);"],
 *      "transaction": true
 *    }
 * 
 */
router.post('/payroll', async (req, res) => {
  // TODO: input validation
  const body = req.body;
  // Check required fields exist
  const requiredFields = ['employee_id', 'hours_worked', 'pay_period', 'tax_rate'];
  if(utils.checkRequiredFields(requiredFields, body)) {
    const client = await db.connect().catch((err) => utils.connectionError(err, res));
    if(client) {
      let queries = [];
      try {
        await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Create a new payroll entry\n');
        await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

        let args = [
          format('%L::INT', body.hours_worked),
          'weekly_hours',
          'hourly_wage'
        ];
        const calcGross = format('\n\t\tCASE\n\t\t\tWHEN %s <= 4.4 * %I THEN %1$s * %3$I\n\t\t\tELSE (1.5 * %1$s - 0.5* 4.4 * %I) * %I\n\t\tEND gross_income', ...args);
        
        args = [
          'employee_id',
          format('%L::INT', body.hours_worked),
          format('%L::DATE', body.pay_period),
          format('%L::REAL', body.tax_rate)
        ];
        const calcGrossColumns = format('e.%I, %s AS hours_worked, %s AS pay_period, %s AS tax_rate', ...args);
        
        args = [
          calcGrossColumns,
          calcGross,
          'employee',
          'job',
          'job_id',
          'salary',
          'employee_id',
          body.employee_id
        ];
        const calcGrossString = '\n\tSELECT %s,%s\n\tFROM %I e\n\t\tJOIN %I j ON e.%5$I = j.%5$I\n\t\tJOIN %I s ON e.%7$I = s.%7$I\n\tWHERE NOT e.%5$I = 0\n\tAND e.%7$I = %L\n';
        const calcGrossQuery = format(calcGrossString, ...args);

        args = [
          requiredFields,
          'gross_income',
          'tax_rate'
        ];
        const calcNet = format('%I,%I,%2$I * %I AS taxed_income,%2$I * (1 - %I) AS net_income', ...args);
        args = [
          'payroll',
          [...requiredFields, 'gross_income', 'taxed_income', 'net_income'],
          calcNet,
          calcGrossQuery
        ];
        const dbQuery = format('INSERT INTO %I(%I)\nSELECT %s\nFROM (%s) AS gross_calc\nRETURNING *;', ...args);
        const result = await utils.transacQuery(queries, client, dbQuery); 

        await utils.transacQuery(queries, client, 'COMMIT;');
        await utils.transacQuery(queries, client, 'END TRANSACTION;\n');
        client.release();
        res.json({
          rows: result.rows,
          queries: queries,
          transaction: true
        });
      } catch(err) {
        console.log(err.stack);
        await utils.transacQuery(queries, client, 'ROLLBACK;\n');
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
});

/**
 * @api {post} /payroll/all Create a new payroll entry for every employee
 * @apiName CreateAllPayrolls
 * @apiGroup Payroll
 * @apiDescription Attempts to insert a new payroll entry for every assigned employee into the database. Returns the inserted entries.
 * 
 * @apiBody {String}   pay_period       Pay period
 * @apiBody {Number}   tax_rate         Tax rate
 * 
 * @apiSuccess {Object[]} rows                Results from the database
 * @apiSuccess {Number}   rows.payroll_id     Payroll ID
 * @apiSuccess {Number}   rows.employee_id    Employee ID
 * @apiSuccess {Number}   rows.hours_worked   Hours worked by employee
 * @apiSuccess {String}   rows.pay_period     Pay period
 * @apiSuccess {Number}   rows.tax_rate       Tax rate
 * @apiSuccess {String}   rows.gross_income   Gross income
 * @apiSuccess {String}   rows.taxed_income   Taxed income
 * @apiSuccess {String}   rows.net_income     Net income
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
 *                "hours_worked": 42,
 *                "pay_period": "2021-11-01"
 *                "tax_rate": 0.10,
 *                "gross_income": "$3,200.00",
 *                "taxed_income": "$320.00",
 *                "net_income": "$2880.00",
 *               }],
 *      "queries": ["INSERT INTO table VALUES(...);"],
 *      "transaction": true
 *    }
 * 
 */
router.post('/payroll/all', async(req, res) => {
  // TODO: input validation
  const body = req.body;
  // Check required fields exist
  const requiredFields = ['pay_period', 'tax_rate'];
  if(utils.checkRequiredFields(requiredFields, body)) {
    const client = await db.connect().catch((err) => utils.connectionError(err, res));
    if(client) {
      let queries = [];
      try {
        await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Create a new payroll entry for every assigned employee\n');
        await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

        let args = [
          'employee_id',
          '(4.4 * weekly_hours)::real',
          format('%L::DATE', body.pay_period),
          format('%L::REAL', body.tax_rate),
          'hourly_wage'
        ];
        const calcGrossColumns = format('e.%I, %s AS hours_worked, %s AS pay_period, %s AS tax_rate, %2$s * %5$I AS gross_income', ...args);
        
        args = [
          calcGrossColumns,
          'employee',
          'job',
          'job_id',
          'salary',
          'employee_id'
        ];
        const calcGrossString = '\n\tSELECT %s\n\tFROM %I e\n\t\tJOIN %I j ON e.%4$I = j.%4$I\n\t\tJOIN %I s ON e.%6$I = s.%6$I\n\tWHERE NOT e.%4$I = 0\n';
        const calcGrossQuery = format(calcGrossString, ...args);

        args = [
          requiredFields,
          'gross_income',
          'tax_rate',
          'hours_worked',
          'employee_id'
        ];
        const calcNet = format('%I,%I,%2$I * %I AS taxed_income,%2$I * (1 - %I) AS net_income,%I,%I', ...args);
        args = [
          'payroll',
          [...requiredFields,'gross_income', 'taxed_income', 'net_income', 'hours_worked', 'employee_id'],
          calcNet,
          calcGrossQuery
        ];
        const dbQuery = format('INSERT INTO %I(%I)\nSELECT %s\nFROM (%s) AS gross_calc\nRETURNING *;', ...args);
        const result = await utils.transacQuery(queries, client, dbQuery); 

        await utils.transacQuery(queries, client, 'COMMIT;');
        await utils.transacQuery(queries, client, 'END TRANSACTION;\n');
        client.release();
        res.json({
          rows: result.rows,
          queries: queries,
          transaction: true
        });
      } catch(err) {
        console.log(err.stack);
        await utils.transacQuery(queries, client, 'ROLLBACK;\n');
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
});