const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../db');

const router = new Router();
module.exports = router;

// DBMS table information
const tableParams = require('./employee.json');

/**
 * @api {get} /employee Get all employees
 * @apiName GetAllEmployees
 * @apiGroup Employee
 * 
 * @apiQuery {String {1-3 Non empty strings}}           [q]             Filter rows based on query. Maximum of 3 arguments
 * @apiQuery {String=id,name,title,department}          [searchBy=name] Used if <code>q</code> is specified
 * @apiQuery {Number {1+}}                              [page=1]        Specify <code>page</code> if there are more employees than <code>limit</code>
 * @apiQuery {String=id,fname,lname,title,department}   [sort=id]       How rows are sorted
 * @apiQuery {String=asc,desc}                          [order=asc]     Receive rows in ascending or descending order
 * @apiQuery {Number {1-100}}                          [limit=10]      The maximum number of rows to receive
 * 
 * @apiSuccess {Object[]} rows                  Results from the database
 * @apiSuccess {Number}   rows.employee_id      Employee's ID number
 * @apiSuccess {String}   rows.first_name       Employee's first name
 * @apiSuccess {String}   [rows.m_initial]      Employee's middle initial (can be null)
 * @apiSuccess {String}   rows.last_name        Employee's last name
 * @apiSuccess {String}   rows.job_title        Employee's job title
 * @apiSuccess {String}   rows.department_name  Department employee works in

 * @apiSuccess {String[]} queries     Array of queries used
 * @apiSuccess {Boolean}  transaction True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
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
 */
router.get('/employee', async (req, res) => {
  // TODO: Input validation
  const params = req.query;
  const page = params.page ? params.page : 1;
  const sortBy = tableParams[params.sort] ? tableParams[params.sort] : tableParams.id;
  const order = params.order ? params.order.toUpperCase() : 'ASC';
  const limit = params.limit ? Math.min(Math.max(params.limit, 1), 100) : 10;

  // Filtering logic
  const query = params.q && params.q.toString().trim() !== '' ? params.q.toString().trim().toUpperCase() : '';
  let filterString = '';
  if(query) {
    const searchBy = params.searchBy && tableParams[params.searchBy] ? params.searchBy : 'name';
    switch(searchBy) {
      case 'title':
      case 'department':
        filterString = format('WHERE %I LIKE \'%%%s%%\'\n', tableParams[searchBy], query);
        break;

      case 'id':
        filterString = format('WHERE %I = %L\n', tableParams.id, query);
        break;

      case 'name':
        const words = query.split(' ');
        switch(words.length) {
          case 1:
            // Search by either first or last name
            filterString = format('WHERE %I LIKE \'%s%%\'\n', tableParams.fname, words[0]); // Case 1
            filterString += format('\tOR %I LIKE \'%s%%\'\n', tableParams.lname, words[0]); // Case 2
            break;
          case 2:
            // Search by either first, middle name; first, last name; or last, first name
            filterString = format('WHERE %I LIKE \'%s%%\' AND %I LIKE \'%s%%\'\n', tableParams.fname, words[0], tableParams.minitial, words[1]); // Case 1
            filterString += format('\tOR %I LIKE \'%s%%\' AND %I LIKE \'%s%%\'\n', tableParams.fname, words[0], tableParams.lname, words[1]); // Case 2
            filterString += format('\tOR %I LIKE \'%s%%\' AND %I LIKE \'%s%%\'\n', tableParams.lname, words[0], tableParams.fname, words[1]); // Case 3
            break;
          case 3:
            // Search by either first, middle, last name or last, middle, first name
            const args = [tableParams.fname, words[0], tableParams.minitial, words[1], tableParams.lname, words[2]];
            filterString = format('WHERE %I LIKE \'%s%%\' AND %I LIKE \'%s%%\' AND %I LIKE \'%s%%\'\n', ...args); // Case 1
            filterString += format('\tOR %5$I LIKE \'%2$s%%\' AND %3$I LIKE \'%4$s%%\' AND %1$I LIKE \'%2$s%%\'\n', ...args); // Case 2
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
    tableParams.id, 
    tableParams.fname, 
    tableParams.minitial, 
    tableParams.lname,
    tableParams.title,
    tableParams.department
  ];
  const joinArgs = [
    tableParams.empTable,
    tableParams.jobTable,
    tableParams.job_id,
    tableParams.depTable,
    tableParams.dep_id
  ];
  const orderArgs = [  
    sortBy, 
    order, 
    limit * (page - 1), 
    limit 
  ];
  const queryString = `SELECT %I\nFROM %I e\n\tJOIN %I j\n\tON e.%4$s = j.%4$s\n\tJOIN %I d\n\tON j.%6$s = d.%6$s\n${filterString}ORDER BY %I %s\nOFFSET %s\nLIMIT %s;`;
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

router.post('/employee', async (req, res) => {

});