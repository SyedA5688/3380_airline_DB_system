const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');
const utils = require('../route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {put} /job/:job_id Change job details
 * @apiName ChangeJobDetails
 * @apiGroup Jobs
 * @apiDescription Attempts to alter job details based on body parameters. Returns the job id on success.
 * 
 * @apiParam  {Number}         job_id   ID of the job to modify
 * 
 * @apiBody {String}  [job_title]             Job title
 * @apiBody {Number}  [department_id]         Department ID
 * @apiBody {Number}  [location_id]           Location ID
 * @apiBody {Number}  [benefits_package_id]   Benefits package ID
 * @apiBody {Number}  [weekly_hours]          Weekly hours
 * 
 * @apiSuccess {Object[]} rows          Results from the database
 * @apiSuccess {Number}   rows.job_id   Job ID number
 * @apiSuccess {String[]} queries       Array of queries used
 * @apiSuccess {Boolean}  transaction   True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "job_id": 123
 *               }],
 *      "queries": ["UPDATE table\nSET column = value\nWHERE job_id = 123;"],
 *      "transaction": true
 *    }
 * 
 */
 router.put('/job/:job_id', async (req, res) => {
  const job_id = req.params.job_id;
  if(job_id && /^\d+$/.test(job_id)) {
    const body = req.body;
    if(body['job_id']) {
      res.status(403).json({
        error: 'Cannot modify blacklisted attributes',
        blacklist: ['job_id'],
        queries: [],
        transaction: false
      });
    } else {
      const params = utils.separateFields(['job'], body);
      if(!utils.isEmpty(params['job']) ) {
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

            // Check job exists first
            let query = format('SELECT %1$I\nFROM %I\nWHERE %1$I = %3$L;', 'job_id', 'job', job_id);
            if(!(await utils.transacQuery(queries, client, query)).rows.length) throw new Error('Job not found!');

            let updateString = '';
            Object.keys(params['job']).forEach((key) => {
              params['job'][key] = params['job'][key].toString().trim().toUpperCase();
              if(!params['job'][key]) throw new Error(`${key} is empty!`);
              updateString += `\t${key} = '${params['job'][key]}',\n`;
            });
            updateString = updateString.substring(0, updateString.length - 2);
            const args = [
              'job',
              updateString,
              'job_id',
              job_id
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
      error: 'Invalid or missing job id',
      queries: [],
      transaction: false
    });
  }
});

/**
 * @api {delete} /job/:id Delete a job
 * @apiName DeleteJob
 * @apiGroup Jobs
 * @apiDescription Attempts to delete the job with the supplied ID. Returns rowCount instead of rows.
 * 
 * @apiParam {Number}     id  Job ID number
 * 
 * @apiSuccess {Number}   rowCount    Number of deletions. 0 = unsuccessful, 1 = successful
 * @apiSuccess {String[]} queries     Array of queries used
 * @apiSuccess {Boolean}  transaction True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rowCount": 1,
 *      "queries": ["DELETE FROM table\nWHERE id = 123;"],
 *      "transaction": true
 *    }
 */
router.delete('/job/:id', async (req, res) => {
  const id = req.params.id;
  if(id && /^\d+$/.test(id)) {
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

        const dbQuery = format('DELETE FROM %I\nWHERE %I = %L', 'job', 'job_id', id);
        const result = await utils.transacQuery(queries, client, dbQuery);

        await utils.transacQuery(queries, client, 'COMMIT;');
        await utils.transacQuery(queries, client, 'END TRANSACTION;\n');
        client.release();
        res.json({
          rowCount: result.rowCount,
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
      error: 'Invalid or missing id',
      queries: [],
      transaction: false
    });
  }
});