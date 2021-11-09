const { Pool } = require('pg');
const creds = require('./esql_creds.json');

/* 
Inside of esql_creds.json, just fill in the following and paste into file
{
  "host": "",
  "user": "",
  "password": "",
  "database": ""
}
*/
// #postgres://username:password@hostname:port/database

const pool = new Pool(creds);

module.exports = pool;
