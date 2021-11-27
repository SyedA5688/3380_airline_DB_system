const employee = require('./employee');
const job = require('./job');
const benefits = require('./benefits');
const department = require('./department');

module.exports = (app) => {
  app.use(employee);
  app.use(job);
  app.use(benefits);
  app.use(department);
};
