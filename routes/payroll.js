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

 * @apiQuery {String {non-empty}}             [q]                 Filter rows based on query
 * @apiQuery {String=id,period,employee,job}  [searchBy=period]   Used if <code>q</code> is specified. <code>employee</code> and <code>job</code> searches by ID
 * @apiQuery {Number {1+}}                    [page=1]            Specify <code>page</code> if there are more results than <code>limit</code>
 * @apiQuery {String=id,period,employee,job}  [sort=period]       How rows are sorted
 * @apiQuery {String=asc,desc}                [order=asc]         Receive rows in ascending or descending order
 * @apiQuery {Number {1-100}}                 [limit=10]          The maximum number of rows to receive
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.payroll_id       Payroll ID
 * @apiSuccess {Number}   rows.employee_id      Employee ID
 * @apiSuccess {Number}   rows.job_id           Job ID
 * @apiSuccess {Number}   rows.salary_id        Salary ID
 * @apiSuccess {Number}   [rows.leave_id]       Leave ID
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
 *                "job_id": 555,
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
    period: 'pay_period',
    employee: 'employee_id',
    job: 'job_id'
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
 * @apiBody {Number}   [job_id]         Job ID. If left blank, will default to current job
 * @apiBody {Number}   [salary_id]      Salary ID. If left blank, will default to current salary.
 * @apiBody {Number}   [leave_id]       Leave ID. Won't actually affect anything for the sake of simplicity.
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.payroll_id       Payroll ID
 * @apiSuccess {Number}   rows.employee_id      Employee ID
 * @apiSuccess {Number}   rows.salary_id        Salary ID
 * @apiSuccess {Number}   [rows.leave_id]       Leave ID
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
 *                "leave_id": null,
 *                "hours_worked": 42,
 *                "pay_period": "2021-11-01"
 *                "tax_rate": 0.10
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
  const optionalFields = ['job_id', 'salary_id', 'leave_id'];
  if(utils.checkRequiredFields(requiredFields, body)) {
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
        await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;');
        await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

        // Check employee exists and get optional ids
        const params = utils.getParameters(requiredFields, optionalFields, body);
        const args = [
          optionalFields, 
          'employee', 
          'salary', 
          'leave', 
          'employee_id',
          body.employee_id
        ];
        let dbQuery = format('SELECT %I\nFROM %I e\n\tNATURAL JOIN %I\n\tLEFT JOIN %I l\n\tON l.%I = e.%5$I\nWHERE e.%5$I = %L;', ...args);
        const ids = (await utils.transacQuery(queries, client, dbQuery)).rows;
        if(!ids.length) throw new Error('Invalid employee');
        optionalFields.forEach((field) => {
          if(!params.names.includes(field) && ids[0][field] && field !== 'leave_id') {
            params.names.push(field);
            params.values.push(ids[0][field]);
          }
        });

        dbQuery = format('INSERT INTO %I (%I)\nVALUES (%L)\nRETURNING *;', 'payroll', params.names, params.values);
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
 * @api {get} /payroll/:id Get pay details
 * @apiName GetPayroll
 * @apiGroup Payroll
 * @apiDescription Returns gross, taxed, and net income corresponding to a payroll entry. Returns no rows if the payroll ID does not exist.
 * 
 * @apiParam {Number} id Payroll ID
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.payroll_id       Payroll ID
 * @apiSuccess {Number}   rows.gross            Gross income
 * @apiSuccess {Number}   rows.tax              Taxed income
 * @apiSuccess {Number}   rows.net              Net income
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "payroll_id": 123,
 *                "gross": "$400",
 *                "tax": "$40",
 *                "net": "$360"
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 * 
 */
router.get('/payroll/:id', async (req, res) => {
  const id = req.params.id;
  if(id && /^\d+$/.test(id)) {
    let args = [
      'hours_worked',
      'weekly_hours',
      'hourly_wage'
    ];
    const calcGross = format('\n\t\tCASE\n\t\t\tWHEN %I <= %I THEN %1$I * %3$I\n\t\t\tELSE (1.5 * %1$I - 0.5 * %I) * %I\n\t\tEND gross', ...args);
    args = [
      ['payroll_id', 'tax_rate'],
      calcGross,
      'payroll',
      'job',
      'job_id',
      'salary',
      'salary_id',
      'payroll_id',
      id
    ];
    const calcGrossString = '\n\tSELECT %I,%s\n\tFROM %I p\n\t\tJOIN %I j ON p.%5$I = j.%5$I\n\t\tJOIN %I s ON p.%7$I = s.%7$I\n\tWHERE %I = %L\n';
    const calcGrossQuery = format(calcGrossString, ...args);

    args = [
      'payroll_id',
      'gross',
      'tax_rate',
      calcGrossQuery
    ];
    const dbQuery = format('SELECT %I, %I, %2$I * %I AS tax, %2$I * (1 - %I) AS net\nFROM (%s) AS gross_calc;', ...args);
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
  } else {
    res.status(400).json({
      error: 'Invalid or missing payroll id',
      queries: [],
      transaction: false
    });
  }
});

/**
 * @api {post} /payroll/all Create a new payroll entry for all employees
 * @apiName CreateAllPayrolls
 * @apiGroup Payroll
 * @apiDescription Attempts to insert a new payroll entry for every employee into the database.
 * 
 * @apiBody {String}   pay_period       Pay period
 * @apiBody {Number}   tax_rate         Tax rate
 * 
 * @apiSuccess {Number}   rowCount      Number of payrolls created
 * @apiSuccess {String[]} queries       Array of queries used
 * @apiSuccess {Boolean}  transaction   True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rowCount": 100,
 *      "queries": ["INSERT INTO table VALUES(...);"],
 *      "transaction": true
 *    }
 * 
 */
 router.post('/payroll/all', async (req, res) => {
  // TODO: input validation
  const body = req.body;
  // Check required fields exist
  const requiredFields = ['pay_period', 'tax_rate'];
  if(utils.checkRequiredFields(requiredFields, body)) {
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
      requiredFields.push('hours_worked');
      body.hours_worked = 40;
      try {
        await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;');
        await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

        const empID = (await utils.transacQuery(queries, client, 'SELECT employee_ID\nFROM employee;')).rows;
        for(const id of empID) {
          let args = [
            ['job_id', 'salary_id'], 
            'employee', 
            'salary', 
            'leave', 
            'employee_id',
            id.employee_id
          ];
          let dbQuery = format('SELECT %I\nFROM %I e\n\tNATURAL JOIN %I\n\tLEFT JOIN %I l\n\tON l.%I = e.%5$I\nWHERE e.%5$I = %L;', ...args);
          const ids = (await utils.transacQuery(queries, client, dbQuery)).rows[0];
          
          args = [
            'payroll',
            ['employee_id','pay_period','tax_rate','hours_worked','job_id','salary_id'],
            [id.employee_id, body.pay_period, body.tax_rate, body.hours_worked, ids.job_id, ids.salary_id]
          ];
          dbQuery = format('INSERT INTO %I (%I)\nVALUES (%L);', ...args);
          await utils.transacQuery(queries, client, dbQuery);
        }
        await utils.transacQuery(queries, client, 'COMMIT;');
        await utils.transacQuery(queries, client, 'END TRANSACTION;\n');
        client.release();
        res.json({
          rows: empID.length,
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