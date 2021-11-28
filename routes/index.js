const employee = require('./employee');
const job = require('./job');
const benefits = require('./benefits');
const department = require('./department');
const manager = require('./manager');

module.exports = (app) => {
  app.use(employee);
  app.use(job);
  app.use(benefits);
  app.use(department);
  app.use(manager);
};
