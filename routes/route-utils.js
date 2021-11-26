/* 
 * Utility functions used often in routes
 */
const dbInfo = require('../db/table-info.json');

module.exports = {
  // Checks that required fields exist
  checkRequiredFields: (required, body) => {
    for(const reqField of required) {
      if(!(body[reqField] && body[reqField].toString().trim())) return false;
    }
    return true;
  },
  // Returns an object containing required and optional parameter names and their values that are in body
  getParameters: (required, optional, body) => {
    let paramNames = required;
    optional.forEach((optParam) => {
      if(body[optParam]) paramNames.push(optParam);
    });
    let paramValues = [];
    paramNames.forEach((param) => {
      paramValues.push(body[param]);
    });
    return {
      names: paramNames,
      values: paramValues
    };
  },
  // Separate body fields into their corresponding tables
  separateFields: (tables, body) => {
    let fields = {};
    tables.forEach((key) => fields[key] = {});
    Object.keys(body).forEach((field) => {
      let found = false;
      for(const table of tables) {
        if(dbInfo[table][field]) {
          found = true;
          fields[table][field] = body[field];
          break;
        }
      }
      if(!found) return;
    });
    return fields;
  },
  isEmpty: (object) => {
    return Object.keys(object).length === 0;
  },
  // Utility function to push query to array and query the database
  transacQuery: async (queries, client, query) => {
    queries.push(query);
    return await client.query(query);
  }
};