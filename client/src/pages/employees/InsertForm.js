import React, { Component } from 'react';
import './employeeForms.css'


class InsertForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      insertFirstName: null,
      insertLastName: null,
      insertGender: null,
      insertDOB: null,
      insertHourlyWage: null,
      insertSSN: null,
      insertMiddleInitial: null,
      insertPhone: null,
      insertEmail: null,
      insertJobID: null,
      insertManagerID: null,
      insertAnnualBonus: null,
      insertStreetAddress: null,
      insertCity: null,
      insertCountry: null,
      insertZipCode: null,
      insertState: null
    };
    
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleClear = this.handleClear.bind(this);
  }

  handleChange = async (event) => {
    this.setState({
      [event.target.name]: event.target.value
    });
  };

  componentDidMount() {
    this.listenForFormSubmission();
  }

  listenForFormSubmission() {
    // Fetch HTML form we want to check and validate
    const form = document.querySelector('#insertFormHTML');

    // Add event listener for form submissions, prevent submission if input is invalid
    form.addEventListener('submit', (event) => {
      if (!this.checkInputValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  }

  checkInputValidity() {
    let validInput = true;
    const re = /^[a-z0-9 ]+$/i  // alphanumeric and spaces, length > 0

    // TODO: Validate each input
    
    return validInput;
  }

  assertValidDBResponse(body) {
    // if (!("rows" in body)) {
    //   throw new Error("Something went wrong; GET Request to Database did not return results object.");
    // }
    // else if (!Array.isArray(body.rows)) {
    //   throw new Error("Something went wrong; GET Request to Database returned results object that is not recognized by webpage.");
    // }
    console.log("Response:", body);
  }

  handleSubmit = async (event) => {
    event.preventDefault();
    try {
      // Insert new employee to /employees with POST request
      const body = { 
        first_name: this.state.insertFirstName, 
        last_name: this.state.insertLastName,
        gender: this.state.insertGender,
        dob: this.state.insertDOB,
        hourly_wage: this.state.insertHourlyWage,
        ssn: this.state.insertSSN,
        m_initial: this.state.insertMiddleInitial,
        phone: this.state.insertPhone,
        email: this.state.insertEmail,
        job_id: this.state.insertJobID,
        manager_id: this.state.insertManagerID,
        annual_bonus: this.state.insertAnnualBonus,
        street_address: this.state.insertStreetAddress,
        city: this.state.insertCity,
        country: this.state.insertCountry,
        zip_code: this.state.insertZipCode,
        state: this.state.insertState,
      };
      console.log("Sending inserting new employee POST request with:", body);
  
      const response = await fetch("/employees", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
  
      const newEmployee = await response.json();
      console.log("Employee added into Postgres Employees table:", newEmployee);
  
      this.setState({
        insertFirstName: null,
        insertLastName: null,
        insertGender: null,
        insertDOB: null,
        insertHourlyWage: null,
        insertSSN: null,
        insertMiddleInitial: null,
        insertPhone: null,
        insertEmail: null,
        insertJobID: null,
        insertManagerID: null,
        insertAnnualBonus: null,
        insertStreetAddress: null,
        insertCity: null,
        insertCountry: null,
        insertZipCode: null,
        insertState: null,
        insertedEmployee: newEmployee
      })
    }
    catch (err) {
      console.log("Error occurred while sending Insert Employee POST request to web server:", err.message);
    }
  };
  
  render() {
    return (
      <div className="container mt-5 px-5">
        {/* Error Modal popup, only shows up if React state is toggled by some error in try-catch of POST request to /employee */}
        <div className="modal fade" id="errorModal" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title" id="exampleModalLabel">Error Occurred</h5>
              </div>
              <div className="modal-body">
                Something went wrong while processing your database request, please try again later. <br />

              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        {/* Insert Employee Form */}
        <h4>Insert New Employee Into Database</h4>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="insertFormHTML" onSubmit={this.handleSubmit} noValidate>
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
          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
        </form>
      </div>
    );
  }
}

export default InsertForm
