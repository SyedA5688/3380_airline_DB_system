const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');
const utils = require('./route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {get} /manager Get all managers
 * @apiName GetAllManagers
 * @apiGroup Managers
 * @apiDescription Returns an array of objects containing basic manager information. 
 * 
 * @apiQuery {String {1-3 non-empty strings}}           [q]             Filter rows based on query. Maximum of 3 arguments
 * @apiQuery {String=id,name,title,department}          [searchBy=name] Used if <code>q</code> is specified
 * @apiQuery {Number {1+}}                              [page=1]        Specify <code>page</code> if there are more employees than <code>limit</code>
 * @apiQuery {String=id,fname,lname,title,department}   [sort=id]       How rows are sorted
 * @apiQuery {String=asc,desc}                          [order=asc]     Receive rows in ascending or descending order
 * @apiQuery {Number {1-100}}                           [limit=10]      The maximum number of rows to receive
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.count            Number of employees managed by the manager
 * @apiSuccess {Number}   rows.employee_id      Manager's ID number
 * @apiSuccess {String}   rows.first_name       Manager's first name
 * @apiSuccess {String}   [rows.m_initial]      Manager's middle initial
 * @apiSuccess {String}   rows.last_name        Manager's last name
 * @apiSuccess {String}   rows.job_title        Manager's job title
 * @apiSuccess {String}   rows.department_name  Department manager works in
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "count": 3
 *                "employee_id": 1000000,
 *                "first_name": "JOHN",
 *                "m_initial": "P",
 *                "last_name": "SMITH",
 *                "job_title": "PILOT",
 *                "department_name": "LINE PERSONNEL"
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 * 
 */
 router.get('/manager', async (req, res) => {
  // TODO: Input validation
  const params = req.query;
  const page = params.page ? params.page : 1;
  const sortParams = {
    id: 'employee_id',
    fname: 'first_name',
    lname: 'last_name',
    title: 'job_title',
    department: 'department_name',
    minitial: 'm_initial'
  };
  const sortBy = sortParams[params.sort] ? sortParams[params.sort] : sortParams.id;
  const order = params.order ? params.order.toUpperCase() : 'ASC';
  const limit = params.limit ? Math.min(Math.max(params.limit, 1), 100) : 10;
  // Filtering logic
  const query = params.q && params.q.toString().trim() !== '' ? params.q.toString().trim().toUpperCase() : '';
  let filterString = '';
  if(query) {
    const searchBy = params.searchBy && sortParams[params.searchBy] ? params.searchBy : 'name';
    switch(searchBy) {
      case 'title':
      case 'department':
        filterString = format('WHERE %I LIKE \'%s%%\'\n', sortParams[searchBy], query);
        break;

      case 'id':
        filterString = format('WHERE m.%I = %L\n', sortParams[searchBy], query);
        break;

      case 'name':
        const words = query.split(' ');
        switch(words.length) {
          case 1:
            // Search by either first or last name
            filterString = format('WHERE m.%I LIKE \'%s%%\'\n', sortParams.fname, words[0]); // Case 1
            filterString += format('\tOR m.%I LIKE \'%s%%\'\n', sortParams.lname, words[0]); // Case 2
            break;
          case 2:
            // Search by either first, middle name; first, last name; or last, first name
            filterString = format('WHERE m.%I LIKE \'%s%%\' AND m.%I LIKE \'%s%%\'\n', sortParams.fname, words[0], sortParams.minitial, words[1]); // Case 1
            filterString += format('\tOR m.%I LIKE \'%s%%\' AND m.%I LIKE \'%s%%\'\n', sortParams.fname, words[0], sortParams.lname, words[1]); // Case 2
            filterString += format('\tOR m.%I LIKE \'%s%%\' AND m.%I LIKE \'%s%%\'\n', sortParams.lname, words[0], sortParams.fname, words[1]); // Case 3
            break;
          case 3:
            // Search by either first, middle, last name or last, middle, first name
            const args = [
              sortParams.fname, 
              words[0], 
              sortParams.minitial, 
              words[1], 
              sortParams.lname, 
              words[2]
            ];
            filterString = format('WHERE m.%I LIKE \'%s%%\' AND m.%I LIKE \'%s%%\' AND m.%I LIKE \'%s%%\'\n', ...args); // Case 1
            filterString += format('\tOR m.%5$I LIKE \'%2$s%%\' AND m.%3$I LIKE \'%4$s%%\' AND m.%1$I LIKE \'%2$s%%\'\n', ...args); // Case 2
            break;
          default:
            // Too many parameters; Not supported
            filterString = '';
        }
        break;
      
      default:
        filterString = '';
    }
  }
  // Arguments used to create sql query
  const columnArgs = [ 
    'employee_id', 
    'first_name', 
    'm_initial', 
    'last_name',
    'job_title',
    'department_name'
  ];
  const joinArgs = [
    'employee',
    'manager_id',
    'employee_id',
    'job',
    'job_id',
    'department',
    'department_id'
  ];
  const orderArgs = [  
    sortBy, 
    order, 
    limit * (page - 1), 
    limit 
  ];
  const columnString = format('m.%I,m.%I,m.%I,m.%I,%I,%I', ...columnArgs);
  const joinString = format('FROM %I e\n\tJOIN %1$I m\n\tON e.%I = m.%I\n\tJOIN %I j\n\tON m.%I = j.%5$I\n\tJOIN %I d\n\tON j.%I = d.%7$I', ...joinArgs);
  const queryString = `SELECT COUNT(*),${columnString}\n${joinString}\n${filterString}GROUP BY ${columnString}\nORDER BY %I %s\nOFFSET %s\nLIMIT %s;`;
  const dbQuery = format(queryString,...orderArgs);
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