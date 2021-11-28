const Router = require('express-promise-router');

const job = require('./job');
const jobID = require('./job-id');

const router = new Router();
module.exports = router;

router.use(job);
router.use(jobID);
