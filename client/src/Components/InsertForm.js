import React, { Component } from 'react';
import '../App.css';

class InsertForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      insertFirstName: '',
      insertMiddleInitial: '',
      insertLastName: '',
      insertSSN: '',
      insertDOB: '',
      insertGender: '',
      insertPhone: 1111111111,
      insertEmail: '',
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
              <label className="sr-only" htmlFor="inputEmployeeFirstName">First Name</label>
              <input type="text" className="form-control" id="inputEmployeeFirstName" placeholder="John" name="insertFirstName" value={this.state.insertFirstName} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeMiddleInitial">Middle Initial</label>
              <input type="text" className="form-control" id="inputEmployeeMiddleInitial" placeholder="A" name="insertMiddleInitial" value={this.state.insertMiddleInitial} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeLastName">Last Name</label>
              <input type="text" className="form-control" id="inputEmployeeLastName" placeholder="Doe" name="insertLastName" value={this.state.insertLastName} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeSSN">Social Security Number</label>
              <input type="text" className="form-control" id="inputEmployeeSSN" placeholder="123456789" name="insertSSN" value={this.state.insertSSN} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeDOB">Date of Birth</label>
              <input type="text" className="form-control" id="inputEmployeeDOB" placeholder="2001-11-30" name="insertDOB" value={this.state.insertDOB} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeGender">Gender</label>
              <input type="text" className="form-control" id="inputEmployeeGender" placeholder="M" name="insertGender" value={this.state.insertGender} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeePhone">Phone</label>
              <input type="number" className="form-control" id="inputEmployeePhone" placeholder="8321234567" name="insertPhone" value={this.state.insertPhone} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeEmail">Email</label>
              <input type="text" className="form-control" id="inputEmployeeEmail" placeholder="example@gmail.com" name="insertEmail" value={this.state.insertEmail} onChange={this.handleChange} />
            </div>
          </div>
          <button type="submit" className="btn btn-outline-secondary">Submit</button>
        </form>
      </div>
    );
  }
}

export default InsertForm



