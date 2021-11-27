const employee = require('./employee/employee');
const employeeID = require('./employee/employee-id');
const leave = require('./employee/leave');
const job = require('./job/job');
const benefits = require('./benefits/benefits');
const department = require('./department/department');
const departmentID = require('./department/department-id');


module.exports = (app) => {
  app.use(employee);
  app.use(employeeID);
  app.use(leave);
  app.use(job);
  app.use(benefits);
  app.use(department);
  app.use(departmentID);
};
