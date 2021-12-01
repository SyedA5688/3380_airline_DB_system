const {Pool} = require('pg');
const fs = require('fs').promises;
require('dotenv').config();

// const pool = new Pool({
//   connectionString: process.env.ELEPHANTSQL_URL
// });

const pool = new Pool();

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

    client.query = async (text, comment) => {
      console.log('client executed query:', {text});
      const time = '/* ' + new Date().toLocaleString() +' */\n';
      await fs.writeFile('./db/transaction.sql', (text.includes('BEGIN') ? time : '') + (comment ? comment : '') + text +'\n' ,{ flag: 'a' }, logError); 
      return query.apply(client, [text]);
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

  query: async (text, comment) => {
    const time = '/* ' + new Date().toLocaleString() +' */\n';
    await fs.writeFile('./db/query.sql', time + (comment ? comment : '')+text+'\n\n' ,{ flag: 'a' }, logError);
    const res = await pool.query(text);
    console.log('pool executed query:', { text, rows: res.rowCount });
    return res;
  }
};
