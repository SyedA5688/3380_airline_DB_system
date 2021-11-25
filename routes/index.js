const employee = require('./employee');
const employeeID = require('./employee-id');

module.exports = (app) => {
  app.use(employee);
  app.use(employeeID);
};
