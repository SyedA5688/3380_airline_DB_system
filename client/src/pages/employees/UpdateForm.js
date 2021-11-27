import React, { Component } from 'react';
import './employeeForms.css'


class UpdateForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      editEmployeeID: '',
      editFirstName: '',
      editLastName: '',
      editGender: '',
      editDOB: '',
      editHourlyWage: '',
      editSSN: '',
      editMiddleInitial: '',
      editPhone: '',
      editEmail: '',
      editJobID: '',
      editManagerID: '',
      editAnnualBonus: '',
      editStreetAddress: '',
      editCity: '',
      editCountry: '',
      editZipCode: '',
      editState: ''
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
    const form = document.querySelector('#updateFormHTML');

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
      let body = { 
        first_name: this.state.editFirstName, 
        last_name: this.state.editLastName,
        gender: this.state.editGender,
        dob: this.state.editDOB,
        hourly_wage: this.state.editHourlyWage,
        ssn: this.state.editSSN,
        m_initial: this.state.editMiddleInitial,
        phone: this.state.editPhone,
        email: this.state.editEmail,
        job_id: this.state.editJobID,
        manager_id: this.state.editManagerID,
        annual_bonus: this.state.editAnnualBonus,
        street_address: this.state.editStreetAddress,
        city: this.state.editCity,
        country: this.state.editCountry,
        zip_code: this.state.editZipCode,
        state: this.state.editState,
      };

      for (let [key, value] of Object.entries(body)) {
        // If value is empty string, then delete key-value pair from body object
        if (value==="") {
          delete body[key];
        }
      }
      // console.log("Updating employee with ", body);
  
      const response = await fetch(`/employee/${this.state.editEmployeeID}`, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
      const responseBody = await response.json();

      this.assertValidDBResponse(responseBody);

      this.setState({
        returnedEmployee: responseBody.rows
      });

      document.getElementById("successModal").style.display = "block"
      document.getElementById("successModal").classList.add("show")
    }
    catch (err) {
      console.log("Error occurred while sending Update Employee POST request to server:", err.message);
      document.getElementById("errorModal").style.display = "block"
      document.getElementById("errorModal").classList.add("show")
    }
  };

  closeModal = () => {
    document.getElementById("errorModal").style.display = "none"
    document.getElementById("errorModal").classList.remove("show");
  }

  closeSuccessModal = () => {
    document.getElementById("successModal").style.display = "none"
    document.getElementById("successModal").classList.remove("show");
    this.handleClear();
  }

  handleClear = async (event) => {
    this.setState({
      editEmployeeID: '',
      editFirstName: '',
      editLastName: '',
      editGender: '',
      editDOB: '',
      editHourlyWage: '',
      editSSN: '',
      editMiddleInitial: '',
      editPhone: '',
      editEmail: '',
      editJobID: '',
      editManagerID: '',
      editAnnualBonus: '',
      editStreetAddress: '',
      editCity: '',
      editCountry: '',
      editZipCode: '',
      editState: '',
      returnedEmployee: null
    });

    // Remove was-validated class from form to reset its appearance
    const form = document.querySelector('#updateFormHTML');
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
                Something went wrong while processing your database request, one of your inputs may have been invalid. Please check your inputs, especially manager ID! Contact airport database assistance if necessary. <br />
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <div className="modal fade" id="successModal" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title" >Success</h5>
              </div>
              { this.state.returnedEmployee ? <div className="modal-body">
                Employee with ID {this.state.returnedEmployee[0]["employee_id"]} was updated. <br />
              </div> : <div></div>}
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeSuccessModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Update an Employee's Information</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="updateFormHTML" onSubmit={this.handleSubmit} noValidate>

          <h5>Employee to Update</h5>
          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeEditID">Employee ID</label>
            <input type="number" step="1"  pattern="[0-9]+" className="form-control" id="inputEmployeeEditID" placeholder="1000000" value={this.state.editEmployeeID} name="editEmployeeID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide valid Employee ID to edit.</div>
          </div>

          <h5 className="mt-3" >Update Fields:</h5>
          <small className="form-text text-muted">Note: Only enter in fields that you want updated.</small>
          <div className="input-group" >
            <div className="input-group-prepend">
              <span className="input-group-text" id="">First, MI, Last</span>
            </div>
            <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputEmployeeFirstName" placeholder="John" value={this.state.editFirstName} name="editFirstName" onChange={this.handleChange} />
            <input type="text" pattern="[A-Z]{0,1}" className="form-control" id="inputEmployeeMiddleInitial" placeholder="M" value={this.state.editMiddleInitial} name="editMiddleInitial" onChange={this.handleChange} />
            <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputEmployeeLastName" placeholder="Doe" value={this.state.editLastName} name="editLastName" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid possible names (a-z, A-Z).</div>
          </div>

          <div className="form-group mt-2" >
            <label className="sr-only" htmlFor="inputEmployeeGender">Gender</label>
            <select  className="form-select" id="inputEmployeeGender" defaultValue="select" name="editGender" onChange={this.handleChange } >
              <option disabled value="select"> -- Select an option -- </option>
              <option value="M">Male</option>
              <option value="F">Female</option>
              <option value="O">Other</option>
            </select>
            <div className="invalid-feedback">Please select a gender option.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeDOB">Date of Birth</label>
            <input type="date" className="form-control" id="inputEmployeeDOB" value={this.state.editDOB} name="editDOB" onChange={this.handleChange} />
            <div className="invalid-feedback">Please select your date of birth.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeSSN">Social Security Number</label>
            <input type="text" pattern="[0-9]*" className="form-control" id="inputEmployeeSSN" placeholder="123456789" value={this.state.editSSN} name="editSSN" onChange={this.handleChange} />
          </div>

          <div className="input-group mt-2" >
            <div className="input-group-prepend">
              <span className="input-group-text" id="">Hourly Wage, Annual Bonus</span>
            </div>
            <input type="number" step=".01" pattern="[0-9.]*" className="form-control" id="inputEmployeeHourlyWage" placeholder="15.25" value={this.state.editHourlyWage} name="editHourlyWage" onChange={this.handleChange} />
            <input type="number" step="1" pattern="[0-9]*" className="form-control" id="inputEmployeeAnnualBonus" placeholder="20000" value={this.state.editAnnualBonus} name="editAnnualBonus" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid hourly wage and/or annual bonus.</div>
          </div>

          <div className="input-group mt-2" >
            <div className="input-group-prepend">
              <span className="input-group-text" id="">Phone, Email</span>
            </div>
            <input type="text" pattern="[0-9+]*" className="form-control" id="inputEmployeePhone" placeholder="8321111111" value={this.state.editPhone} name="editPhone" onChange={this.handleChange} />
            <input type="email" className="form-control" id="inputEmployeeEmail" placeholder="example@gmail.com" value={this.state.editEmail} name="editEmail" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid phone and/or email.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeJobID">Job ID</label>
            <input type="number" step="1"  pattern="[0-9]*" className="form-control" id="inputEmployeeJobID" placeholder="1" value={this.state.editJobID} name="editJobID" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid job ID.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeManagerID">Manager ID</label>
            <input type="number" step="1"  pattern="[0-9]*" className="form-control" id="inputEmployeeManagerID" placeholder="1000000 (Must be an existing ID)" value={this.state.editManagerID} name="editManagerID" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid manager ID.</div>
          </div>

          <div className="input-group mt-2" >
            <div className="input-group-prepend">
              <span className="input-group-text" id="">Street Address, City</span>
            </div>
            <input type="text" pattern="[A-Za-z0-9#-. ]*" className="form-control" id="inputEmployeeStreetAddress" placeholder="12345 Some Street LN." value={this.state.editStreetAddress} name="editStreetAddress" onChange={this.handleChange} />
            <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputEmployeeCity" placeholder="Houston" value={this.state.editCity} name="editCity" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid street address and city.</div>
          </div>

          <div className="input-group mt-1" >
            <div className="input-group-prepend">
              <span className="input-group-text" id="">State, Zip Code</span>
            </div>
            <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputEmployeeState" placeholder="Texas" value={this.state.editState} name="editState" onChange={this.handleChange} />
            <input type="text"  pattern="[A-Za-z0-9]*" className="form-control" id="inputEmployeeZipCode" placeholder="77777" value={this.state.editZipCode} name="editZipCode" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid state and zip code.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeCountry">Country</label>
            <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputEmployeeCountry" placeholder="United States" value={this.state.editCountry} name="editCountry" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid country name.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
          </form>
      </div>
    );
  }
}

export default UpdateForm
