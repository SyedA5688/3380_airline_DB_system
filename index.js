const express = require('express');
const cors = require("cors");
const mountRoutes = require('./routes');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 5000;
const server = app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});

app.use(express.static('public'));
app.use(cors());
app.use(express.json());

mountRoutes(app);

const closeServer = () => {
  console.log('Server closing...');
  server.close((err) => {
    console.log('Server closed');
    process.exit(err ? 1 : 0 );
  });
};

process.on('SIGINT', closeServer);
process.on('SIGTERM', closeServer);