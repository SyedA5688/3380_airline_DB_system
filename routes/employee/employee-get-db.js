/*
 * Table column names used in GET /employee route
 * The route was done before the database design was finished, so this serves to redirect
 * the temporary names used to the final table names.
 * TODO: Update names in /employee route to remove this file
 */
const tableInfo = require('../../db/table-info.json');

module.exports = {
  empTable: 'employee',
  id:       tableInfo.employee.employee_id,
  fname:    tableInfo.employee.first_name,
  minitial: tableInfo.employee.m_initial,
  lname:    tableInfo.employee.last_name,

  jobTable: 'job',
  job_id: tableInfo.job.job_id,
  title: tableInfo.job.job_title,

  depTable: 'department',
  dep_id: tableInfo.department.department_id,
  department: tableInfo.department.department_name
};