const express = require('express');
const cors = require("cors");
const mountRoutes = require('./routes');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 5000;
app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});

app.use(express.static('public'));
app.use(cors());
app.use(express.json());

mountRoutes(app);