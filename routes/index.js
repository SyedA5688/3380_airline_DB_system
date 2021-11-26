const employee = require('./employee/employee');
const employeeID = require('./employee/employee-id');
const employeeIDLeave = require('./employee/employee-id-leave');
const job = require('./job/job');

module.exports = (app) => {
  app.use(employee);
  app.use(employeeID);
  app.use(employeeIDLeave);
  app.use(job);
};
