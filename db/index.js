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

const logError = async (err) => {
  console.error(err.stack);
};

module.exports = {
  // Monkey patches default pg-Client methods for logging purposes
  connect: async () => {
    const client =  await pool.connect();
    console.log('client checked out');
    const query = client.query; // Original query method
    const release = client.release; // Original release method

    client.query = async (text, params) => {
      console.log('client executed query:', {text});
      await fs.writeFile('./db/transaction.sql', text+'\n' ,{ flag: 'a' }, logError); 
      return query.apply(client, [text, params]);
    };

    client.release = () => {
      console.log('client released');
      // Set methods back to original versions
      client.query = query;
      client.release = release;
      return release.apply(client);
    };
    return client;
  },

  query: async (text, params) => {
    const res = await pool.query(text, params);
    console.log('pool executed query:', { text, rows: res.rowCount });
    await fs.writeFile('./db/query.sql', text+'\n' ,{ flag: 'a' }, logError);
    return res;
  }
};
