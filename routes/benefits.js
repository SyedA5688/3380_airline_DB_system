const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');
const utils = require('./route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {get} /benefits Get all benefits packages
 * @apiName GetAllBenefits
 * @apiGroup Benefits
 * @apiDescription Returns all benefits packages

 * @apiQuery {String {non-empty}}                               [q]             Filter rows based on query
 * @apiQuery {String=text,id,amount,stock,provider,retirement}  [searchBy=text] Used if <code>q</code> is specified. Text searches by stock, provider, and retirement simultaneously.
 * @apiQuery {Number {1+}}                                      [page=1]        Specify <code>page</code> if there are more results than <code>limit</code>
 * @apiQuery {String=id,amount,stock,provider,retirement}       [sort=id]       How rows are sorted
 * @apiQuery {String=asc,desc}                                  [order=asc]     Receive rows in ascending or descending order
 * @apiQuery {Number {1-100}}                                   [limit=10]      The maximum number of rows to receive
 * 
 * @apiSuccess {Object[]} rows                            Results from the database
 * @apiSuccess {Number}   rows.benefits_package_id        Benefits package ID
 * @apiSuccess {Number}   rows.amount                     Amount
 * @apiSuccess {String}   rows.stock_options              Stock options
 * @apiSuccess {String}   rows.health_insurance_provider  Health insurance provider
 * @apiSuccess {String}   rows.retirement_plan            Retirement plan
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "benefits_package_id": 123,
 *                "amount": "...",
 *                "stock_options": "...",
 *                "health_insurance_provider": "...",
 *                "retirement_plan": "..."
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 */
router.get('/benefits', async (req, res) => {
  const params = req.query;
  const page = params.page ? params.page : 1;
  const sortParams = {
    id: 'benefits_package_id',
    amount: 'amount',
    stock: 'stock_options',
    provider: 'health_insurance_provider',
    retirement: 'retirement_plan'
  };
  const sortBy = sortParams[params.sort] ? sortParams[params.sort] : sortParams.id;
  const order = params.order ? params.order.toUpperCase() : 'ASC';
  const limit = params.limit ? Math.min(Math.max(params.limit, 1), 100) : 10;

  // Filtering logic
  const query = params.q && params.q.toString().trim() !== '' ? params.q.toString().trim().toUpperCase() : '';
  let filterString = '';
  if(query){
    const searchBy = params.searchBy && sortParams[params.searchBy] ? sortParams[params.searchBy] : 'text';
    if(searchBy === 'benefits_package_id' || searchBy === 'amount') filterString = format('WHERE %I = %L\n', searchBy, query);
    else if(searchBy !== 'text') filterString = format('WHERE %I LIKE \'%s%%\'\n', searchBy, query);
    else filterString = format('WHERE %1$I LIKE \'%4$s%%\'\n\tOR %2$I LIKE \'%4$s%%\'\n\tOR %3$I LIKE \'%4$s%%\'\n', sortParams.stock, sortParams.provider, sortParams.retirement, query);
  }
  const orderArgs = [  
    sortBy, 
    order, 
    limit * (page - 1), 
    limit 
  ];
  const queryString = `SELECT *\nFROM %I\n${filterString}ORDER BY %I %s\nOFFSET %s\nLIMIT %s;`;
  const dbQuery = format(queryString, 'benefits',...orderArgs);
  try {
    const result = await db.query(dbQuery, '-- Get benefits packages\n'); 
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
 * @api {post} /benefits Create a new benefits package
 * @apiName AddNewBenefits
 * @apiGroup Benefits
 * @apiDescription Attempts to insert a new benefits package into the database. Returns the inserted benefits package.
 * 
 * @apiBody {String}  health_insurance_provider     Health insurance provider
 * @apiBody {Number}  [amount]                      Amount
 * @apiBody {String}  [stock_options]               Stock options
 * @apiBody {String}  [retirement_plan]             Retirement plan
 * 
 * @apiSuccess {Object[]} rows                            Results from the database
 * @apiSuccess {Number}   rows.benefits_package_id        Benefits package ID
 * @apiSuccess {Number}   rows.amount                     Amount
 * @apiSuccess {String}   rows.stock_options              Stock options
 * @apiSuccess {String}   rows.health_insurance_provider  Health insurance provider
 * @apiSuccess {String}   rows.retirement_plan            Retirement plan
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "benefits_package_id": 123,
 *                "amount": "...",
 *                "stock_options": "...",
 *                "health_insurance_provider": "...",
 *                "retirement_plan": "..."
 *               }],
 *      "queries": ["INSERT INTO table VALUES(...);"],
 *      "transaction": true
 *    }
 */
router.post('/benefits', async (req, res) => {
  // TODO: input validation
  const body = req.body;
  // Check required fields exist
  const requiredFields = ['health_insurance_provider'];
  if(utils.checkRequiredFields(requiredFields, body)) {
    Object.keys(body).forEach((key) => {
      body[key] = body[key].toString().trim().toUpperCase();
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
        await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Create new benefits package\n');
        await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

        const params = utils.getParameters(requiredFields, ['amount', 'stock_options', 'retirement_plan'], body);
        let query = format('INSERT INTO %I (%I)\nVALUES (%L)\nRETURNING *;', 'benefits', params.names, params.values);
        const result = await utils.transacQuery(queries, client, query);

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
 * @api {put} /benefits/:id Change benefits package details
 * @apiName ChangeBenefitsDetails
 * @apiGroup Benefits
 * @apiDescription Attempts to alter a benefits package based on body parameters. Returns the benefits package id on success.
 * 
 * @apiParam {Number} id  Benefits package ID
 * 
 * @apiBody {String}  [health_insurance_provider]   Health insurance provider
 * @apiBody {Number}  [amount]                      Amount
 * @apiBody {String}  [stock_options]               Stock options
 * @apiBody {String}  [retirement_plan]             Retirement plan
 * 
 * @apiSuccess {Object[]} rows                      Results from the database
 * @apiSuccess {Number}   rows.benefits_package_id  Benefits package ID
 * @apiSuccess {String[]} queries                   Array of queries used
 * @apiSuccess {Boolean}  transaction               True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "benefits_package_id": 123
 *               }],
 *      "queries": ["UPDATE table\nSET column = value;"],
 *      "transaction": true
 *    }
 */
router.put('/benefits/:id', async (req, res) => {
  const id = req.params.id;
  if(id && /^\d+$/.test(id)) {
    const body = req.body;
    if(body['benefits_package_id']) {
      res.status(403).json({
        error: 'Cannot modify blacklisted attributes',
        blacklist: ['benefits_package_id'],
        queries: [],
        transaction: false
      });
    } else {
      const params = utils.separateFields(['benefits'], body);
      if(!utils.isEmpty(params['benefits']) ) {
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
            await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Update benefits package details\n');
            await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

            // Check benefits package exists first
            let query = format('SELECT %1$I\nFROM %I\nWHERE %1$I = %3$L;', 'benefits_package_id', 'benefits', id);
            if(!(await utils.transacQuery(queries, client, query, '-- Check benefits package exists\n')).rows.length) throw new Error('Benefits package not found!');

            let updateString = '';
            Object.keys(params['benefits']).forEach((key) => {
              params['benefits'][key] = params['benefits'][key].toString().trim().toUpperCase();
              if(!params['benefits'][key]) throw new Error(`${key} is empty!`);
              updateString += `\t${key} = '${params['benefits'][key]}',\n`;
            });
            updateString = updateString.substring(0, updateString.length - 2);

            const args = [
              'benefits',
              updateString,
              'benefits_package_id',
              id
            ];
            const dbQuery = format('UPDATE %I\nSET\n%s\nWHERE %I = %L\nRETURNING %3$I;', ...args);
            const result = await utils.transacQuery(queries, client, dbQuery, '\n');

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
      error: 'Invalid or missing benefits package id',
      queries: [],
      transaction: false
    });
  }
});