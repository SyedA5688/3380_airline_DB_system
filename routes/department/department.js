const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');
const utils = require('../route-utils');

const router = new Router();
module.exports = router;

// Get all departments
router.get('/department', async (req, res) => {

});

// Create new department
router.post('/department', async (req, res) => {
  
});
