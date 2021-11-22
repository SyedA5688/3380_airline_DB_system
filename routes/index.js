const employee = require('./employee');

module.exports = (app) => {
  app.use(employee);
};