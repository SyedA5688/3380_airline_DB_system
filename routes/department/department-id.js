const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');
const utils = require('../route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {put} /department/:id Change department details
 * @apiName ChangeDepartmentDetails
 * @apiGroup Departments
 * @apiDescription Attempts to alter a department based on body parameters. Returns the department id on success.
 * 
 * @apiParam {Number} id  Department ID
 * 
 * @apiBody {String=a-z}  [department_name]      Department name
 * @apiBody {String}      [creation_date]        Date department was created
 * @apiBody {Number}      [department_head_id]   Department head ID
 * 
 * @apiSuccess {Object[]} rows                      Results from the database
 * @apiSuccess {Number}   rows.department_id        Department ID
 * @apiSuccess {String[]} queries                   Array of queries used
 * @apiSuccess {Boolean}  transaction               True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "department_id": 123
 *               }],
 *      "queries": ["UPDATE table\nSET column = value;"],
 *      "transaction": true
 *    }
 */
 router.put('/department/:id', async (req, res) => {
  const id = req.params.id;
  if(id && /^\d+$/.test(id)) {
    const body = req.body;
    if(body['department_id']) {
      res.status(403).json({
        error: 'Cannot modify blacklisted attributes',
        blacklist: ['department_id'],
        queries: [],
        transaction: false
      });
    } else {
      const params = utils.separateFields(['department'], body);
      if(!utils.isEmpty(params['department']) ) {
        const client = await db.connect().catch((err) => utils.connectionError(err, res));
        if(client) {
          let queries = [];
          try {
            await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Update department details\n');
            await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

            // Check department exists first
            let query = format('SELECT %1$I\nFROM %I\nWHERE %1$I = %3$L;', 'department_id', 'department', id);
            if(!(await utils.transacQuery(queries, client, query)).rows.length) throw new Error('Department not found!');

            let updateString = '';
            Object.keys(params['department']).forEach((key) => {
              params['department'][key] = params['department'][key].toString().trim().toUpperCase();
              if(!params['department'][key]) throw new Error(`${key} is empty!`);
              updateString += `\t${key} = '${params['department'][key]}',\n`;
            });
            updateString = updateString.substring(0, updateString.length - 2);

            const args = [
              'department',
              updateString,
              'department_id',
              id
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
      error: 'Invalid or missing department id',
      queries: [],
      transaction: false
    });
  }
});

/**
 * @api {delete} /department/:id Delete a department
 * @apiName DeleteDepartment
 * @apiGroup Departments
 * @apiDescription Attempts to delete the department with the supplied ID. Returns rowCount instead of rows.
 * 
 * @apiParam {Number}     id  Department ID number
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
 router.delete('/department/:id', async (req, res) => {
  const id = req.params.id;
  if(id && /^\d+$/.test(id)) {
    const client = await db.connect().catch((err) => utils.connectionError(err, res));
    if(client) {
      let queries = [];
      try {
        await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Delete department\n');
        await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

        const dbQuery = format('DELETE FROM %I\nWHERE %I = %L', 'department', 'department_id', id);
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