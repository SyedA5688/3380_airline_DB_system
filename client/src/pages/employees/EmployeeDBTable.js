import React, { Component } from 'react';


class EmployeeDBTable extends Component {
  constructor(props) {
    super(props);
    this.state = {
      employees: []
    };

    this.insertNewEmployee = this.insertNewEmployee.bind(this)
  }

  componentDidMount = async () => {
    // const res = await fetch('/employees');
    // const body = await res.json();
    const body = {rows:[]}
    console.log("Request body from app mounting get request:", body);  // Either { queries, rows, transaction } or { error, rows, transaction }
    this.setState({
      employees: body.rows
    });
  };

  insertNewEmployee = async (employee) => {
    // Append new employee to state variable. New employee will be passed in from Child InsertForm component
    this.setState({
      employees: [...this.state.employees, employee]
    })
  }

  render() {
    return (
      <div className="">
        <h3>Employee Database Table</h3>
        <h5>(In ElephantSQL, Showing for Visualization)</h5>
        <div className="">
          <table align="center" className="table table-striped" >
            <thead className="thead-dark">
              <tr>
                <th scope="col">ID</th>
                <th scope="col">First Name</th>
                <th scope="col">Middle Initial</th>
                <th scope="col">Last Name</th>
                <th scope="col">SSN</th>
                <th scope="col">Date of Birth</th>
                <th scope="col">Gender</th>
                <th scope="col">Phone</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Job ID</th>
                <th scope="col">City ID</th>
              </tr>
            </thead>
            {/* Add Employees in tbody through HTML injection in main.js */}
            <tbody>
              {this.state.employees && this.state.employees.map(employeeObj => (
                <tr key={employeeObj.employee_id}>
                <th scope="col">{employeeObj.employee_id}</th>
                <th scope="col">{employeeObj.first_name}</th>
                <th scope="col">{employeeObj.m_initial}</th>
                <th scope="col">{employeeObj.last_name}</th>
                <th scope="col">{employeeObj.ssn}</th>
                <th scope="col">{employeeObj.dob}</th>
                <th scope="col">{employeeObj.gender}</th>
                <th scope="col">{employeeObj.phone}</th>
                <th scope="col">{employeeObj.email}</th>
                <th scope="col">{employeeObj.address}</th>
                <th scope="col">{employeeObj.job_id}</th>
                <th scope="col">{employeeObj.city_id}</th>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    );
  }
}

export default EmployeeDBTable