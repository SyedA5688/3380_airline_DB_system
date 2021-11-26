const Router = require('express-promise-router');
const format = require('pg-format');
const db = require('../../db');
const utils = require('../route-utils');

const router = new Router();
module.exports = router;

// Get all benefits packages
router.get('/benefits', async (req, res) => {

});

// Create new benefits package
router.post('/benefits', async (req, res) => {
  
});

// Change existing benefits package details
router.put('/benefits/:id', async (req, res) => {
  
});