const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');
const utils = require('../route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {delete} /employee/:id Delete an employee
 * @apiName DeleteEmployee
 * @apiGroup Employees
 * @apiDescription Attempts to delete the employee with the supplied ID. Returns rowCount instead of rows.
 * 
 * @apiParam {Number}     id  Employee's ID number
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
router.delete('/employee/:id', async (req, res) => {
  const id = req.params.id;
  if(id && /^\d+$/.test(id)) {
    const client = await db.connect().catch((err) => utils.connectionError(err, res));
    if(client) {
      let queries = [];
      try {
        await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Delete employee\n');
        await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

        const dbQuery = format('DELETE FROM %I\nWHERE %I = %L', 'employee', 'employee_id', id);
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