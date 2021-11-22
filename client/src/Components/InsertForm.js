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
      insertPhone: '',
      insertEmail: '',
      insertAddress: '',
      insertCity: '',
      insertState: '',
      insertZipCode: '',
      insertCountry: '',
      insertJobID: ''
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
      // Check for invalid input to web form
      // TODO - check empty input, correct input type, user errors


      // Insert new employee to /employees with POST request
      const body = { 
        first_name: this.state.insertFirstName, 
        m_initial: this.state.insertMiddleInitial,
        last_name: this.state.insertLastName,
        ssn: this.state.insertSSN,
        dob: this.state.insertDOB,
        gender: this.state.insertGender,
        phone: this.state.insertPhone,
        email: this.state.insertEmail,
        address: this.state.insertAddress,
        city: this.state.insertCity,
        state: this.state.insertState,
        zip_code: this.state.insertZipCode,
        country: this.state.insertCountry,
        job_id: this.state.insertJobID,
      };
      console.log("Sending inserting new employee POST request with:", body);
  
      const response = await fetch("/employees", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
  
      const newEmployee = await response.json();
      console.log("Employee added into Postgres Employees table:", newEmployee);
      this.props.insertNewEmployee(newEmployee);
  
      this.setState({
        insertFirstName: '',
        insertMiddleInitial: '',
        insertLastName: '',
        insertSSN: '',
        insertDOB: '',
        insertGender: '',
        insertPhone: 0,
        insertEmail: '',
        insertAddress: '',
        insertCity: '',
        insertState: '',
        insertZipCode: '',
        insertCountry: '',
        insertJobID: ''
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
              <input type="number" className="form-control" id="inputEmployeePhone" placeholder="8321111111" name="insertPhone" value={this.state.insertPhone} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeEmail">Email</label>
              <input type="text" className="form-control" id="inputEmployeeEmail" placeholder="example@gmail.com" name="insertEmail" value={this.state.insertEmail} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeAddress">Address</label>
              <input type="text" className="form-control" id="inputEmployeeAddress" placeholder="12345 Some Street LN" name="insertAddress" value={this.state.insertAddress} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeCity">City</label>
              <input type="text" className="form-control" id="inputEmployeeEmail" placeholder="Houston" name="insertCity" value={this.state.insertCity} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeState">State</label>
              <input type="text" className="form-control" id="inputEmployeeEmail" placeholder="Texas" name="insertState" value={this.state.insertState} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeZipCode">Zip Code</label>
              <input type="text" className="form-control" id="inputEmployeeEmail" placeholder="12345" name="insertZipCode" value={this.state.insertZipCode} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeCountry">Country</label>
              <input type="text" className="form-control" id="inputEmployeeEmail" placeholder="United States" name="insertCountry" value={this.state.insertCountry} onChange={this.handleChange} />
            </div>
            <div className="form-group">
              <label className="sr-only" htmlFor="inputEmployeeJobID">Job ID</label>
              <input type="number" className="form-control" id="inputEmployeeJobID" placeholder="4" name="insertJobID" value={this.state.insertJobID} onChange={this.handleChange} />
            </div>
          </div>
          <button type="submit" className="btn btn-outline-secondary">Submit</button>
        </form>
      </div>
    );
  }
}

export default InsertForm



