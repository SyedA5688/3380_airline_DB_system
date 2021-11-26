const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');

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
 * @apiSuccess {String}   rows.department_id        Department ID
 * @apiSuccess {String}   rows.department_name      Department name
 * @apiSuccess {String}   rows.location_id          Location ID
 * @apiSuccess {String}   rows.weekly_hours         Weekly hours
 * @apiSuccess {String}   rows.benefits_package_id  Benefits package ID
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
  const page = params.page ? params.page : 1;
  const sortParams = {
    id: 'job_id',
    title: 'job_title',
    department: 'department_name',
    location: 'location_id'
  };
  const sortBy = sortParams[params.sort] ? sortParams[params.sort] : sortParams.title;
  const order = params.order ? params.order.toUpperCase() : 'ASC';
  const limit = params.limit ? Math.min(Math.max(params.limit, 1), 100) : 10;

  // Filtering logic
  const query = params.q && params.q.toString().trim() !== '' ? params.q.toString().trim().toUpperCase() : '';
  let filterString = '';
  if(query){
    const searchBy = params.searchBy && sortParams[params.searchBy] ? sortParams[params.searchBy] : sortParams.title;
    filterString = format('WHERE %I LIKE \'%s%%\'\n', searchBy, query);
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
  const orderArgs = [  
    sortBy, 
    order, 
    limit * (page - 1), 
    limit 
  ];
  const queryString = `SELECT %I\nFROM %I\nNATURAL JOIN %I\n${filterString}ORDER BY %I %s\nOFFSET %s\nLIMIT %s;`;
  const dbQuery = format(queryString, columnArgs, ...joinArgs,...orderArgs);
  try {
    const result = await db.query(dbQuery);
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
