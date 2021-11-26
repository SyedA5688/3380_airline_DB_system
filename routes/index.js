const employee = require('./employee');
const employeeID = require('./employee-id');
const employeeIDLeave = require('./employee-id-leave');
const job = require('./job');

module.exports = (app) => {
  app.use(employee);
  app.use(employeeID);
  app.use(employeeIDLeave);
  app.use(job);
};
