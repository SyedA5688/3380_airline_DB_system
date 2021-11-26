const employee = require('./employee/employee');
const employeeID = require('./employee/employee-id');
const leave = require('./employee/leave');
const job = require('./job/job');
const benefits = require('./benefits/benefits');

module.exports = (app) => {
  app.use(employee);
  app.use(employeeID);
  app.use(leave);
  app.use(job);
  app.use(benefits);
};
