const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');
const utils = require('../route-utils');

const router = new Router();
module.exports = router;

/**
 * @api {get} /job/location Get all job locations
 * @apiName GetAllLocations
 * @apiGroup Jobs
 * @apiDescription Returns an array of objects containing job location information. 
 * 
 * @apiSuccess {Object[]} rows                Results from the database
 * @apiSuccess {Number}   rows.location_id    Location ID
 * @apiSuccess {Number}   rows.address_id     Address ID
 * @apiSuccess {String}   [rows.airport_id]   Airport ID
 * @apiSuccess {String}   [rows.flight_id ]   Flight ID
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "location_id": 123,
 *                "address_id": 321,
 *                "airport_id": 111,
 *                "flight_id": 222
 *               }],
 *      "queries": ["SELECT *\nFROM table;"],
 *      "transaction": false
 *    }
 * 
 */
router.get('/job/location', async (req, res) => {
  const dbQuery = format('SELECT *\nFROM %I;', 'job_location');
  try {
    const result = await db.query(dbQuery, '-- Get all job locations\n');
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
 * @api {post} /job/location Create a new job location
 * @apiName AddNewLocation
 * @apiGroup Jobs
 * @apiDescription Attempts to insert a new job location into the database. Returns the inserted location on success.
 * 
 * @apiBody {Number}   rows.address_id     Address ID
 * @apiBody {String}   [rows.airport_id]   Airport ID
 * @apiBody {String}   [rows.flight_id ]   Flight ID
 * 
 * @apiSuccess {Object[]} rows                Results from the database
 * @apiSuccess {Number}   rows.location_id    Location ID
 * @apiSuccess {Number}   rows.address_id     Address ID
 * @apiSuccess {String}   [rows.airport_id]   Airport ID
 * @apiSuccess {String}   [rows.flight_id ]   Flight ID
 * 
 * @apiSuccess {String[]} queries               Array of queries used
 * @apiSuccess {Boolean}  transaction           True if transactions were used
 * 
 * @apiSuccessExample {json} Success-Response example:
 *    HTTP/1.1 200 OK
 *    {
 *      "rows": [{
 *                "location_id": 123,
 *                "address_id": 321,
 *                "airport_id": 111,
 *                "flight_id": 222
 *               }],
 *      "queries": ["INSERT INTO table VALUES(...);"],
 *      "transaction": true
 *    }
 * 
 */
router.post('/job/location', async (req, res) => {
  // TODO: input validation
  const body = req.body;
  // Check required fields exist
  const requiredFields = ['address_id'];
  if(utils.checkRequiredFields(requiredFields, body)) {
    Object.keys(body).forEach((key) => {
      body[key] = body[key].toString().trim().toUpperCase();
    });

    const client = await db.connect().catch((err) => utils.connectionError(err, res));
    if(client) {
      let queries = [];
      try {
        await utils.transacQuery(queries, client, 'BEGIN TRANSACTION;', '-- Create new job location\n');
        await utils.transacQuery(queries, client, 'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');

        const params = utils.getParameters(requiredFields, ['airport_id', 'flight_id'], body);
        let query = format('INSERT INTO %I (%I)\nVALUES (%L)\nRETURNING *;', 'job_location', params.names, params.values);
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
