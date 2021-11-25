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
  }
};