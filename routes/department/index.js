const Router = require('express-promise-router');

const department = require('./department');
const departmentID = require('./department-id');

const router = new Router();
module.exports = router;

router.use(department);
router.use(departmentID);
