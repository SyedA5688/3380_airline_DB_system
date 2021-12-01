const express = require('express');
const cors = require('cors');
const path = require('path');
const mountRoutes = require('./routes');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 5000;
const server = app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});

app.use(cors());
app.use(express.json());
// app.use(express.static(path.join(__dirname, './client/build')));

mountRoutes(app);

const closeServer = () => {
  console.log('Server closing...');
  server.close();
};

server.on('close', () => {
  console.log('Server closed');
  process.exit();
});

process.on('SIGINT', closeServer);
process.on('SIGTERM', closeServer);
