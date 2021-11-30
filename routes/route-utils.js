/* 
 * Utility functions used often in routes
 */
const dbInfo = require('../db/table-info.json');
const format = require('pg-format');

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
  transacQuery: async (queries, client, query, comment) => {
    queries.push(query);
    return await client.query(query, comment);
  },

  connectionError: (err, res) => {
    console.log(err.stack);
    res.status(500).json({
      error: 'Error connecting client to database',
      queries: [],
      transaction: false
    });
  },
  // Default ordering for GET requests
  orderingParams: (params, sortParams, defaultSort) => {
    const page = params.page ? params.page : 1;
    const sortBy = sortParams[params.sort] ? sortParams[params.sort] : sortParams[defaultSort];
    const order = params.order && params.order.trim().toUpperCase() === 'DESC' ? params.order.trim().toUpperCase() : 'ASC';
    const limit = params.limit ? Math.min(Math.max(params.limit, 1), 100) : 10;

    const orderArgs = [  
      sortBy, 
      order, 
      limit * (page - 1), 
      limit 
    ];
    const orderString = format('ORDER BY %I %s\nOFFSET %s\nLIMIT %s', ...orderArgs);
    return orderString;
  },

};