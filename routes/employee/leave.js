const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');
const utils = require('../route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {get} /employee/:id/leave Get employee leave details
 * @apiName GetEmployeeLeave
 * @apiGroup Leave
 * @apiDescription Returns the employee with the given id's leave details.
 * 
 * @apiParam {Number}     id  Employee's ID number
 * 
 * @apiQuery {String {non-empty}}                 [q]             Filter rows based on query
 * @apiQuery {String=text,id,date,status,reason}  [searchBy=text] Used if <code>q</code> is specified. Text searches by status and reason simultaneously.
 * @apiQuery {Number {1+}}                        [page=1]        Specify <code>page</code> if there are more results than <code>limit</code>
 * @apiQuery {String=id,date,status,reason}       [sort=date]     How rows are sorted
 * @apiQuery {String=asc,desc}                    [order=asc]     Receive rows in ascending or descending order
 * @apiQuery {Number {1-100}}                     [limit=10]      The maximum number of rows to receive
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
 *                "leave_id": 123,
 *                "employee_id": 1000000,
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
    const params = req.query;
    const sortParams = {
      id: 'leave_id',
      date: 'date',
      reason: 'reason',
      status: 'status'
    };
    const {page, sortBy, order, limit} = utils.orderingParams(params, sortParams, 'date');

    // Filtering logic
    const query = params.q && params.q.toString().trim() !== '' ? params.q.toString().trim().toUpperCase() : '';
    let filterString = format('WHERE %I = %L\n', 'employee_id', id);
    if(query){
      const searchBy = params.searchBy && sortParams[params.searchBy] ? sortParams[params.searchBy] : 'text';
      if(searchBy === 'leave_id') filterString += format('\tAND %I = %L\n', searchBy, query);
      else if(searchBy !== 'text') filterString += format('\tAND %I LIKE \'%s%%\'\n', searchBy, query);
      else filterString += format('\tAND (%1$I LIKE \'%3$s%%\' OR %2$I LIKE \'%3$s%%\')\n', sortParams.reason, sortParams.status, query);
    }
    const orderArgs = [  
      sortBy, 
      order, 
      limit * (page - 1), 
      limit 
    ];
    const queryString = `SELECT *\nFROM %I\n${filterString}ORDER BY %I %s\nOFFSET %s\nLIMIT %s;`;
    const dbQuery = format(queryString, 'leave',...orderArgs);
    try {
      const result = await db.query(dbQuery, '-- Get employee leave entries\n'); 
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
      error: 'Invalid or missing id',
      queries: [],
      transaction: false
    });
  }
});

/**
 * @api {post} /employee/:id/leave Create new leave for employee
 * @apiName AddNewLeave
 * @apiGroup Leave
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
 *                "leave_id": 123,
 *                "employee_id": 1000000,
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

      const client = await db.connect().catch((err) => utils.connectionError(err, res));
      if(client) {
        let queries = [];
        try {
          await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Create new leave entry for employee\n');
          await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

          const params = utils.getParameters(requiredFields, [], body);
          const dbQuery = format('INSERT INTO %I (%I,%I)\nVALUES (%L,%L)\nRETURNING *;',
            'leave', 'employee_id', params.names, id, params.values);
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
  } else {
    res.status(400).json({
      error: 'Invalid or missing id',
      queries: [],
      transaction: false
    });
  }
});

/**
 * @api {get} /leave Get all leave details
 * @apiName GetAllLeaves
 * @apiGroup Leave
 * @apiDescription Returns all leave details

 * @apiQuery {String {non-empty}}                 [q]             Filter rows based on query
 * @apiQuery {String=text,id,date,status,reason}  [searchBy=text] Used if <code>q</code> is specified. Text searches by status and reason simultaneously.
 * @apiQuery {Number {1+}}                        [page=1]        Specify <code>page</code> if there are more results than <code>limit</code>
 * @apiQuery {String=id,date,status,reason}       [sort=date]     How rows are sorted
 * @apiQuery {String=asc,desc}                    [order=asc]     Receive rows in ascending or descending order
 * @apiQuery {Number {1-100}}                     [limit=10]      The maximum number of rows to receive
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
 *                "leave_id": 123,
 *                "employee_id": 1000000,
 *                "date": "2021-11-25",
 *                "reason": "MEDICAL",
 *                "status": "PENDING"
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 * 
 */
router.get('/leave', async (req, res) => {
  const params = req.query;
  const sortParams = {
    id: 'leave_id',
    date: 'date',
    reason: 'reason',
    status: 'status'
  };
  const {page, sortBy, order, limit} = utils.orderingParams(params, sortParams, 'date');

  // Filtering logic
  const query = params.q && params.q.toString().trim() !== '' ? params.q.toString().trim().toUpperCase() : '';
  let filterString = '';
  if(query){
    const searchBy = params.searchBy && sortParams[params.searchBy] ? sortParams[params.searchBy] : 'text';
    if(searchBy === sortParams.id || searchBy === sortParams.date) filterString = format('WHERE %I = %L\n', searchBy, query);
    else if(searchBy !== 'text') filterString = format('WHERE %I LIKE \'%s%%\'\n', searchBy, query);
    else filterString = format('WHERE %1$I LIKE \'%3$s%%\' OR %2$I LIKE \'%3$s%%\'\n', sortParams.reason, sortParams.status, query);
  }
  const orderArgs = [  
    sortBy, 
    order, 
    limit * (page - 1), 
    limit 
  ];
  const queryString = `SELECT *\nFROM %I\n${filterString}ORDER BY %I %s\nOFFSET %s\nLIMIT %s;`;
  const dbQuery = format(queryString, 'leave',...orderArgs);
  try {
    const result = await db.query(dbQuery, '-- Get all leave entries\n'); 
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
 * @api {put} /leave/:leave_id Change existing leave details
 * @apiName ChangeLeaveDetails
 * @apiGroup Leave
 * @apiDescription Attempts to alter leave details based on body parameters. 
 * Returns the leave id on success.
 * 
 * @apiParam  {Number}         leave_id   ID of the leave to modify
 * 
 * @apiBody   {String}         [date]     Date issued
 * @apiBody   {String=[a-z]}   [reason]   Reason for leave
 * @apiBody   {String=[a-z]}   [status]   Status of leave
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.leave_id         Leave ID
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "leave_id": 123
 *               }],
 *      "queries": ["UPDATE table\nSET column = value\nWHERE leave_id = 123;"],
 *      "transaction": true
 *    }
 * 
 */
router.put('/leave/:leave_id', async (req,res) => {
  const leave_id = req.params.leave_id;
  if(leave_id && /^\d+$/.test(leave_id)) {
    const body = req.body;
    if(body['employee_id', 'leave_id']) {
      res.status(403).json({
        error: 'Cannot modify blacklisted attributes',
        blacklist: ['employee_id', 'leave_id'],
        queries: [],
        transaction: false
      });
    } else {
      const params = utils.separateFields(['leave'], body);
      if(!utils.isEmpty(params['leave']) ) {
        const client = await db.connect().catch((err) => utils.connectionError(err, res));
        if(client) {
          let queries = [];
          try {
            await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Update leave entry\n');
            await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

            // Check leave exists first
            let query = format('SELECT %1$I\nFROM %I\nWHERE %1$I = %3$L;', 'leave_id', 'leave', leave_id);
            if(!(await utils.transacQuery(queries, client, query)).rows.length) throw new Error('Leave not found!');

            let updateString = '';
            Object.keys(params['leave']).forEach((key) => {
              params['leave'][key] = params['leave'][key].toString().trim().toUpperCase();
              if(!params['leave'][key]) throw new Error(`${key} is empty!`);
              updateString += `\t${key} = '${params['leave'][key]}',\n`;
            });
            updateString = updateString.substring(0, updateString.length - 2);
            const args = [
              'leave',
              updateString,
              'leave_id',
              leave_id
            ];
            const dbQuery = format('UPDATE %I\nSET\n%s\nWHERE %I = %L\nRETURNING %3$I;', ...args);
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
        res.status(400).json({
          error: 'Empty body',
          queries: [],
          transaction: false
        });
      }
    }
  } else {
    res.status(400).json({
      error: 'Invalid or missing leave id',
      queries: [],
      transaction: false
    });
  }
});