import React, { Component } from 'react';
import './employeeForms.css'


class InsertForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      insertFirstName: '',
      insertLastName: '',
      insertGender: 'M',
      insertDOB: '',
      insertHourlyWage: '',
      insertSSN: '',
      insertMiddleInitial: '',
      insertPhone: '',
      insertEmail: '',
      insertJobID: '',
      insertManagerID: '',
      insertAnnualBonus: '',
      insertStreetAddress: '',
      insertCity: '',
      insertCountry: '',
      insertZipCode: '',
      insertState: '',
      showSQL: false,
    };
    
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleClear = this.handleClear.bind(this);
    this.toggleSQL = this.toggleSQL.bind(this);
  }

  toggleSQL = async(event) => {
    if (this.state.queries) {
      this.setState({
        showSQL: !this.state.showSQL
      });
    }
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
    const form = document.querySelector('#insertFormHTML');

    form.addEventListener('submit', (event) => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  }

  assertValidDBResponse(body) {
    if (!("rows" in body)) {
      throw new Error("Something went wrong; GET Request to Database did not return results object.");
    }
    else if (!Array.isArray(body.rows)) {
      throw new Error("Something went wrong; GET Request to Database returned results object that is not recognized by webpage.");
    }
  }

  handleSubmit = async (event) => {
    event.preventDefault();
    try {
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
      // console.log("Sending inserting new employee POST request with:", body);
  
      const response = await fetch("/employee", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
  
      const responseBody = await response.json();
      // console.log(responseBody);
      this.assertValidDBResponse(responseBody);
  
      this.setState({
        insertedEmployee: responseBody.rows,
        queries: responseBody.queries
      });
    }
    catch (err) {
      console.log("Error occurred while sending Insert Employee POST request to server:", err.message);
      document.getElementById("errorModal").style.display = "block"
      document.getElementById("errorModal").classList.add("show")
    }
  };

  closeModal = () => {
    document.getElementById("errorModal").style.display = "none"
    document.getElementById("errorModal").classList.remove("show");
  }

  handleClear = async (event) => {
    this.setState({
      insertFirstName: '',
      insertLastName: '',
      insertGender: 'M',
      insertDOB: '',
      insertHourlyWage: '',
      insertSSN: '',
      insertMiddleInitial: '',
      insertPhone: '',
      insertEmail: '',
      insertJobID: '',
      insertManagerID: '',
      insertAnnualBonus: '',
      insertStreetAddress: '',
      insertCity: '',
      insertCountry: '',
      insertZipCode: '',
      insertState: '',
      insertedEmployee: null,
      queries: null,
      showSQL: false
    });

    // Remove was-validated class from form to reset its appearance
    const form = document.querySelector('#insertFormHTML');
    form.classList.remove('was-validated');
  }
  
  render() {
    return (
      <div className="container mt-5 px-5">
        <div className="modal fade" id="errorModal" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title" id="exampleModalLabel">Error Occurred</h5>
              </div>
              <div className="modal-body">
                Something went wrong while processing your database request. Please try again and check your form inputs, especially Manager ID! <br />
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Insert New Employee Into Database</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="insertFormHTML" onSubmit={this.handleSubmit} noValidate>

          <div className="input-group" >
            <div className="input-group-prepend">
              <span className="input-group-text" id="">First*, MI, Last*</span>
            </div>
            <input type="text" pattern="[A-Za-z ]+" className="form-control" id="inputEmployeeFirstName" placeholder="John" value={this.state.insertFirstName} name="insertFirstName" onChange={this.handleChange} required />
            <input type="text" pattern="[A-Z]{0,1}" className="form-control" id="inputEmployeeMiddleInitial" placeholder="M (Optional)" value={this.state.insertMiddleInitial} name="insertMiddleInitial" onChange={this.handleChange} />
            <input type="text" pattern="[A-Za-z ]+" className="form-control" id="inputEmployeeLastName" placeholder="Doe" value={this.state.insertLastName} name="insertLastName" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide valid possible names (a-z, A-Z).</div>
          </div>

          <div className="form-group mt-2" >
            <label className="sr-only" htmlFor="inputEmployeeGender">Gender*</label>
            <select  className="form-select" id="inputEmployeeGender" value={this.state.insertGender} name="insertGender" onChange={this.handleChange } required >
              <option value="M">Male</option>
              <option value="F">Female</option>
              <option value="O">Other</option>
            </select>
            <div className="invalid-feedback">Please select a gender option.</div>
          </div>
          
          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeDOB">Date of Birth*</label>
            <input type="date" className="form-control" id="inputEmployeeDOB" value={this.state.insertDOB} name="insertDOB" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please select your date of birth.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeSSN">Social Security Number</label>
            <input type="text" pattern="[0-9]*" className="form-control" id="inputEmployeeSSN" placeholder="123456789 (Optional)" value={this.state.insertSSN} name="insertSSN" onChange={this.handleChange} />
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeHourlyWage">Hourly Wage*</label>
            <input type="number" step=".01" pattern="[0-9.]+" className="form-control" id="inputEmployeeHourlyWage" placeholder="15.25" value={this.state.insertHourlyWage} name="insertHourlyWage" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide valid hourly wage.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeAnnualBonus">Annual Bonus*</label>
            <input type="number" step="1" pattern="[0-9]+" className="form-control" id="inputEmployeeAnnualBonus" placeholder="20000" value={this.state.insertAnnualBonus} name="insertAnnualBonus" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide valid annual bonus.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeePhone">Phone</label>
            <input type="text" pattern="[0-9+]*" className="form-control" id="inputEmployeePhone" placeholder="8321111111" value={this.state.insertPhone} name="insertPhone" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid phone number.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeEmail">Email</label>
            <input type="email" className="form-control" id="inputEmployeeEmail" placeholder="example@gmail.com" value={this.state.insertEmail} name="insertEmail" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid email.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeJobID">Job ID</label>
            <input type="number" step="1"  pattern="[0-9]*" className="form-control" id="inputEmployeeJobID" placeholder="1" value={this.state.insertJobID} name="insertJobID" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid job ID.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeManagerID">Manager ID</label>
            <input type="number" step="1"  pattern="[0-9]*" className="form-control" id="inputEmployeeManagerID" placeholder="1000000 (Must be an existing ID)" value={this.state.insertManagerID} name="insertManagerID" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid manager ID.</div>
          </div>

          <div className="input-group mt-2" >
            <div className="input-group-prepend">
              <span className="input-group-text" id="">Street Address*, City*</span>
            </div>
            <input type="text" pattern="[A-Za-z0-9#-. ]+" className="form-control" id="inputEmployeeStreetAddress" placeholder="12345 Some Street LN." value={this.state.insertStreetAddress} name="insertStreetAddress" onChange={this.handleChange} required />
            <input type="text" pattern="[A-Za-z ]+" className="form-control" id="inputEmployeeCity" placeholder="Houston" value={this.state.insertCity} name="insertCity" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide valid street address and city.</div>
          </div>

          <div className="input-group mt-1" >
            <div className="input-group-prepend">
              <span className="input-group-text" id="">State, Zip Code</span>
            </div>
            <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputEmployeeState" placeholder="Texas" value={this.state.insertState} name="insertState" onChange={this.handleChange} />
            <input type="text"  pattern="[A-Za-z0-9]*" className="form-control" id="inputEmployeeZipCode" placeholder="77777" value={this.state.insertZipCode} name="insertZipCode" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid state and zip code.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeCountry">Country*</label>
            <input type="text" pattern="[A-Za-z ]+" className="form-control" id="inputEmployeeCountry" placeholder="United States" value={this.state.insertCountry} name="insertCountry" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide valid country name.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>

        {this.state.insertedEmployee ? 
        <div>
          <h3 className="mt-5 ">Inserted Employee</h3>
          <table align="center" className="table border mt-3 mb-5" >
            <thead className="table-dark">
              <tr>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Middle Initial</th>
                <th scope="col">Employee ID</th>
                <th scope="col">Job Title</th>
                <th scope="col">Department Name</th>
              </tr>
            </thead>
            {/* Add Employees in tbody through HTML injection in main.js */}
            <tbody>
              {this.state.insertedEmployee && this.state.insertedEmployee.map((employeeObj, index) => (
                <tr key={employeeObj.employee_id}>
                  <th scope="col">{employeeObj.first_name}</th>
                  <th scope="col">{employeeObj.last_name}</th>
                  <th scope="col">{employeeObj.m_initial}</th>
                  <th scope="col">{employeeObj.employee_id}</th>
                  <th scope="col">{employeeObj.job_title}</th>
                  <th scope="col">{employeeObj.department_name}</th>
                </tr>
              ))}
            </tbody>
          </table>

          <button type="button" className="btn btn-outline-secondary mx-3 mb-3" onClick={this.toggleSQL} >Toggle SQL</button>
          {this.state.showSQL ? 
          <div className="mb-5" >
            {this.state.queries.map((queryText, index) => (
              <span style={{whiteSpace: 'pre-wrap'}} key={index}>{queryText}<br/></span>
            ))}
          </div> : <div></div>}
        </div>:
        <div></div>}
      </div>
    );
  }
}

export default InsertForm
