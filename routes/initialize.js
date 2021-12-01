const Router = require('express-promise-router');
const db = require('../db');
const fs = require('fs').promises;
const utils = require('./route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {delete} /init Initialize database
 * @apiName Init
 * @apiGroup Initialize
 * @apiDescription Deletes and recreates the tables in the database with initial population values.
 * 
 * @apiSuccess {Boolean}  success     Whether it was successful
 * @apiSuccess {String[]} queries     Array of queries used
 * @apiSuccess {Boolean}  transaction True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "success": true,
 *      "queries": ["DELETE FROM table\nWHERE id = 123;"],
 *      "transaction": true
 *    }
 */
router.delete('/init', async (req, res) => {
  const client = await db.connect().catch((err) => utils.connectionError(err, res));
  if(client) {
    let queries = [];
    try {
      // Delete tables
      await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Delete all tables\n');
      await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');
      const deleteScript = (await fs.readFile('./delete_tables_script.sql', 'utf8')).split('\r\n');
      for(const query of deleteScript) {
        await utils.transacQuery(queries, client, query);
      }
      await utils.transacQuery(queries, client, 'COMMIT;');
      await utils.transacQuery(queries, client, 'END TRANSACTION;\n');
      
      // Recreate tables from script
      const createScript = (await fs.readFile('./create_tables_script.sql', 'utf8')).split(';');
      await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Recreate tables from script\n');
      await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

      for(const query of createScript) {
        if(query !== '\r\n' && query !== '\n') await utils.transacQuery(queries, client, query + ';');
      }
      await utils.transacQuery(queries, client, 'COMMIT;');
      await utils.transacQuery(queries, client, 'END TRANSACTION;\n');
      client.release();
      res.json({
        success: true,
        queries: queries,
        transaction: true
      });
    } catch(err) {
      console.log(err.stack);
      await utils.transacQuery(queries, client, 'ROLLBACK;\n');
      client.release();
      res.status(500).json({
        error: err.message,
        queries: queries,
        transaction: true
      });
    }
  }
});