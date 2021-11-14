import React, { Component } from 'react';
import '../App.css';

class InsertForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      insertID: 0,
      insertFirstName: '',
      insertLastName: '',
      insertJobTitle: '',
      insertSalary: 0
    };
    
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange = async (event) => {
    this.setState({
      [event.target.name]: event.target.value
    });
  };

  handleSubmit = async (event) => {
    event.preventDefault();
    try {
      // insert new demo to /employees with POST request
      const body = { 
        id: this.state.insertID, 
        first_name: this.state.insertFirstName, 
        last_name: this.state.insertLastName, 
        job_title: this.state.insertJobTitle, 
        salary: this.state.insertSalary 
      };
      console.log(body);
  
      // connect to heroku? Remove localhost:port
      const response = await fetch("/employees", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
  
      const newEmployee = await response.json();
      console.log("Employee added into Postgres Employees table:", newEmployee);
      this.props.insertNewEmployee(newEmployee);
  
      this.setState({
        insertID: 0,
        insertFirstName: '',
        insertLastName: '',
        insertJobTitle: '',
        insertSalary: 0
      })
    }
    catch (err) {
      console.log("Error occurred while sending Insert Employee POST request to web server:", err.message);
    }
  };
  
  render() {
    return (
      <div className="insert-employee-form-container" >
        <h4>Insert New Employee Into Database</h4>
        <form className="form-inline" onSubmit={this.handleSubmit}>
          <div className="input-group">
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeID">ID Number</label>
              <input type="number" className="form-control" id="inputEmployeeID" placeholder="Employee ID" name="insertID" value={this.state.insertID} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeFirstName">First Name</label>
              <input type="text" className="form-control" id="inputEmployeeFirstName" placeholder="First Name" name="insertFirstName" value={this.state.insertFirstName} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeLastName">Last Name</label>
              <input type="text" className="form-control" id="inputEmployeeLastName" placeholder="Last Name" name="insertLastName" value={this.state.insertLastName} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeJobTitle">Job Title</label>
              <input type="text" className="form-control" id="inputEmployeeJobTitle" placeholder="Job Title" name="insertJobTitle" value={this.state.insertJobTitle} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeSalary">Salary</label>
              <input type="number" className="form-control" id="inputEmployeeSalary" placeholder="Salary" name="insertSalary" value={this.state.insertSalary} onChange={this.handleChange} />
            </div>
          </div>
          <button type="submit" className="btn btn-outline-secondary">Submit</button>
        </form>
      </div>
    );
  }
}

export default InsertForm



