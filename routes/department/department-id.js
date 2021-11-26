const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');
const utils = require('../route-utils');

const router = new Router();
module.exports = router;

// Get all jobs belonging to department
router.get('/department/:id', async (req, res) => {

});

// Change existing department details
router.put('/department/:id', async (req, res) => {
  
});
