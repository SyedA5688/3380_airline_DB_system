const {Pool} = require('pg');
const fs = require('fs').promises;
require('dotenv').config();

const pool = new Pool({
  connectionString: process.env.ELEPHANTSQL_URL
});

const endPool = () => {
  console.log('Disconnecting pool...');
    pool.end()
      .then(console.log('Pool disconnected'))
      .catch((err) => console.error('Could not disconnect pool\n', err.stack));
};
process.on('exit', endPool);

module.exports = {
  connect: async () => {
    const client =  await pool.connect();
    console.log('client connected');
    return client;
  },
  query: async (text, params) => {
    const res = await pool.query(text, params);
    console.log('executed query', { text, rows: res.rowCount });
    await fs.writeFile('./db/log.txt', text+'\n' ,{ flag: 'a' }, err => {
      if(err) console.error(err.stack);
    });
    return res;
  }
};