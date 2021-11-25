/*
 * Table column names used in GET /employee route
 */
const tableInfo = require('../db/table-info.json');

module.exports = {
  empTable: 'employee',
  id:       tableInfo.employee.id,
  fname:    tableInfo.employee.fname,
  minitial: tableInfo.employee.minitial,
  lname:    tableInfo.employee.lname,

  jobTable: 'job',
  job_id: tableInfo.job.id,
  title: tableInfo.job.title,

  depTable: 'department',
  dep_id: tableInfo.department.id,
  department: tableInfo.department.name
};