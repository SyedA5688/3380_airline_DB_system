const employee = require('./employee');
const employeeID = require('./employee-id');
const employeeIDLeave = require('./employee-id-leave');

module.exports = (app) => {
  app.use(employee);
  app.use(employeeID);
  app.use(employeeIDLeave);
};
