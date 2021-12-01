const employee = require('./employee');
const job = require('./job');
const benefits = require('./benefits');
const department = require('./department');
const manager = require('./manager');
const payroll = require('./payroll');
const initialize = require('./initialize');

module.exports = (app) => {
  app.use(employee);
  app.use(job);
  app.use(benefits);
  app.use(department);
  app.use(manager);
  app.use(payroll);
  app.use(initialize);
};
