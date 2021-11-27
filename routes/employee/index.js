const Router = require('express-promise-router');

const employee = require('./employee');
const employeeID = require('./employee-id');
const employeeDelete = require('./employee-delete');
const leave = require('./leave');

const router = new Router();
module.exports = router;

router.use(employee);
router.use(employeeID);
router.use(employeeDelete);
router.use(leave);