const express = require('express');
const cors = require("cors");
const mountRoutes = require('./routes');
const db = require('./db');
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

const closeServer = async () => {
  try {
    await db.end();
  } finally {
    server.close(() => {
      console.log('Server closing...');
      server.close(() => {
        console.log('Server closed');
        process.exit();
      });
    });
  }
};

process.on('SIGINT', closeServer);
process.on('SIGTERM', closeServer);