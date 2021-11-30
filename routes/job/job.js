const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');
const utils = require('../route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {get} /job Get all jobs
 * @apiName GetAllJobs
 * @apiGroup Jobs
 * @apiDescription Returns an array of objects containing job information. 
 * 
 * @apiQuery {String {non-empty}}   [q]             Filter rows based on query
 * @apiQuery {String=id,title,department,location}  [searchBy=title]  Used if <code>q</code> is specified
 * @apiQuery {Number {1+}}                          [page=1]          Specify <code>page</code> if there are more jobs than <code>limit</code>
 * @apiQuery {String=id,title,department,location}  [sort=title]      How rows are sorted
 * @apiQuery {String=asc,desc}                      [order=asc]       Receive rows in ascending or descending order
 * @apiQuery {Number {1-100}}                       [limit=10]        The maximum number of rows to receive
 * 
 * @apiSuccess {Object[]} rows                      Results from the database
 * @apiSuccess {Number}   rows.job_id               Job ID number
 * @apiSuccess {String}   rows.job_title            Job title
 * @apiSuccess {Number}   rows.department_id        Department ID
 * @apiSuccess {String}   rows.department_name      Department name
 * @apiSuccess {Number}   rows.location_id          Location ID
 * @apiSuccess {Number}   rows.weekly_hours         Weekly hours
 * @apiSuccess {Number}   rows.benefits_package_id  Benefits package ID
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "job_id": 123,
 *                "job_title": "TRAVEL AGENT",
 *                "department_id": 123,
 *                "department_name": "SALES AND MARKETING",
 *                "location_id": 123,
 *                "weekly_hours": 40,
 *                "benefits_package_id": 123
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 * 
 */
router.get('/job', async (req, res) => {
  // TODO: Input validation
  const params = req.query;
  const sortParams = {
    id: 'job_id',
    title: 'job_title',
    department: 'department_name',
    location: 'location_id'
  };

  // Filtering logic
  const query = params.q && params.q.toString().trim() !== '' ? params.q.toString().trim().toUpperCase() : '';
  let filterString = '';
  if(query){
    const searchBy = params.searchBy && sortParams[params.searchBy] ? sortParams[params.searchBy] : sortParams.title;
    if(searchBy === 'job_id' || searchBy === 'location_id') filterString = format('WHERE %I = %L\n', searchBy, query);
    else filterString = format('WHERE %I LIKE \'%%%s%%\'\n', searchBy, query);
  }
  // Arguments used to create sql query
  const columnArgs = [ 
    'job_id',        
    'job_title',
    'department_id',    
    'department_name',
    'location_id',
    'weekly_hours',
    'benefits_package_id'
  ];
  const joinArgs = [
    'job',
    'department'
  ];

  const orderString = utils.orderingParams(params, sortParams, 'title');
  const queryString = `SELECT %I\nFROM %I\nNATURAL JOIN %I\n${filterString}${orderString};`;
  const dbQuery = format(queryString, columnArgs, ...joinArgs);
  try { 
    const result = await db.query(dbQuery, '-- Get jobs\n');
    res.json({
      rows: result.rows, 
      queries: [dbQuery],
      transaction: false
    });
  } 
  catch(err) {
    console.error(err.stack);
    res.status(422).json({
      error: err.message,
      queries: [dbQuery],
      transaction: false
    });
  }
});

/**
 * @api {post} /job Add new job
 * @apiName AddJob
 * @apiGroup Jobs
 * @apiDescription Attempts to insert a new job into the database. Returns the new job's information.
 * 
 * @apiBody {String}  job_title            Job title
 * @apiBody {Number}  department_id        Department ID
 * @apiBody {Number}  location_id          Location ID
 * @apiBody {Number}  benefits_package_id  Benefits package ID
 * @apiBody {Number}  [weekly_hours=40]    Weekly hours
 * 
 * @apiSuccess {Object[]} rows                      Results from the database
 * @apiSuccess {Number}   rows.job_id               Job ID number
 * @apiSuccess {String}   rows.job_title            Job title
 * @apiSuccess {Number}   rows.department_id        Department ID
 * @apiSuccess {String}   rows.department_name      Department name
 * @apiSuccess {Number}   rows.location_id          Location ID
 * @apiSuccess {Number}   rows.weekly_hours         Weekly hours
 * @apiSuccess {Number}   rows.benefits_package_id  Benefits package ID
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "job_id": 123,
 *                "job_title": "TRAVEL AGENT",
 *                "department_id": 123,
 *                "department_name": "SALES AND MARKETING",
 *                "location_id": 123,
 *                "weekly_hours": 40,
 *                "benefits_package_id": 123
 *               }],
 *      "queries": ["INSERT INTO table VALUES (...);"],
 *      "transaction": true
 *    }
 * 
 */
router.post('/job', async (req, res) => {
  // TODO: input validation
  const body = req.body;
  body.weekly_hours = body.weekly_hours && body.weekly_hours.toString().trim() ? body.weekly_hours : 40;
  // Check required fields exist
  const requiredFields = ['job_title', 'department_id', 'location_id', 'benefits_package_id'];
  if(utils.checkRequiredFields(requiredFields, body)) {
    Object.keys(body).forEach((key) => {
      body[key] = body[key].toString().trim().toUpperCase();
    });

    const client = await db.connect().catch((err) => utils.connectionError(err, res));
    if(client) {
      let queries = [];
      try {
        await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Add new job\n');
        await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

        const params = utils.getParameters(requiredFields, ['weekly_hours'], body);
        let query = format('INSERT INTO %I (%I)\nVALUES (%L)\nRETURNING job_id;', 'job', params.names, params.values);
        const job_id = (await utils.transacQuery(queries, client, query)).rows[0].job_id;

        await utils.transacQuery(queries, client, 'COMMIT;');
        await utils.transacQuery(queries, client, 'END TRANSACTION;\n');
        client.release();

        const columnArgs = [ 
          'job_id',        
          'job_title',
          'department_id',    
          'department_name',
          'location_id',
          'weekly_hours',
          'benefits_package_id'
        ];
        const joinArgs = [
          'job',
          'department'
        ];
        const queryString = `SELECT %I\nFROM %I\nNATURAL JOIN %I\nWHERE %I = %L;`;
        query = format(queryString, columnArgs, ...joinArgs, 'job_id', job_id);
        const result = await db.query(query);
        queries.push(query);
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
