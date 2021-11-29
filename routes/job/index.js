const Router = require('express-promise-router');

const job = require('./job');
const jobID = require('./job-id');
const jobLocation = require('./job-location');

const router = new Router();
module.exports = router;

router.use(job);
router.use(jobID);
router.use(jobLocation);
