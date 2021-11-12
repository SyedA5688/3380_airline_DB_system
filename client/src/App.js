import React, { Component } from 'react';
// import SearchForm from './Components/SearchForm';
import InsertForm from './Components/InsertForm';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      employees: []
    };

    this.insertNewEmployee = this.insertNewEmployee.bind(this)
  }

  componentDidMount = async () => {
    const res = await fetch('/employees');
    const body = await res.json();
    console.log(body.rows);  // Right now prints undefined, ToDo: see why GET request to /employees returns undefined
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
      <div className="App">
        <header className="App-header">
          <h3 className="App-title">Airline HR Database System</h3>
        </header>

        <div className="page-content-container" >
          {/* <SearchForm /> */}
          <InsertForm insertNewEmployee={this.insertNewEmployee} />

          <div className="database-visual-container">
            <h3>Employee Database Table</h3>
            <h5>(In ElephantSQL, Showing for Visualization)</h5>
            <div className="employee-table-container">
              <table align="center" className="table table-striped" >
                <thead className="thead-dark">
                  <tr>
                    <th scope="col">ID</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Job Title</th>
                    <th scope="col">Salary</th>
                  </tr>
                </thead>
                {/* Add Employees in tbody through HTML injection in main.js */}
                <tbody>
                  {this.state.employees && this.state.employees.map(employeeObj => (
                    <tr key={employeeObj.id}>
                    <th scope="col">{employeeObj.id}</th>
                    <th scope="col">{employeeObj.first_name}</th>
                    <th scope="col">{employeeObj.last_name}</th>
                    <th scope="col">{employeeObj.job}</th>
                    <th scope="col">{employeeObj.salary}</th>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>
        
      </div>   
    );
  }
}

export default App;
