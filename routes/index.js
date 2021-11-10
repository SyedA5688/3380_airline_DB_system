const employees = require('./employees');

module.exports = app => {
  app.use(employees);
};