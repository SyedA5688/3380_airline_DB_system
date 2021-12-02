import React, { Component } from 'react';
import './employeeForms.css'


class GetForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      getID: '',
      showFirstName: false,
      showMInitial: false,
      showLastName: false,
      showID: false,
      showDOB: false,
      showSSN: false,
      showGender: false,
      showEmail: false,
      showPhone: false,
      showStreetAddress: false,
      showCity: false,
      showState: false,
      showZipCode: false,
      showCountry: false,
      showJobTitle: false,
      showDepartmentName: false,
      showWeeklyHours: false,
      showHourlyWage: false,
      showAnnualBonus: false,
      showBenefitsAmount: false,
      showStockOptions: false,
      showHealthInsuranceProvider: false,
      showRetirementPlanNumber: false,
      showSQL: false
    };
    
    // Bad coupling if DB response changes names/details, but need to control which response attributes are shown
    this.db_to_state = {
      "first_name": "showFirstName",
      "m_initial": "showMInitial",
      "last_name": "showLastName",
      "employee_id": "showID",
      "dob": "showDOB",
      "ssn": "showSSN",
      "gender": "showGender",
      "email": "showEmail",
      "phone": "showPhone",
      "street_address": "showStreetAddress",
      "city": "showCity",
      "state": "showState",
      "zip_code": "showZipCode",
      "country": "showCountry",
      "job_title": "showJobTitle",
      "department_name": "showDepartmentName",
      "weekly_hours": "showWeeklyHours",
      "hourly_wage": "showHourlyWage",
      "annual_bonus": "showAnnualBonus",
      "amount": "showBenefitsAmount",
      "stock_options": "showStockOptions",
      "health_insurance_provider": "showHealthInsuranceProvider",
      "retirement_plan": "showRetirementPlanNumber"
    }
    
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
    const form = document.querySelector('#getFormHTML');

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
      const response = await fetch(`/employee/${this.state.getID}`);  
      const responseBody = await response.json();

      this.assertValidDBResponse(responseBody);
      // console.log(responseBody.rows);

      this.setState({
        returnedEmployee: responseBody.rows,
        queries: responseBody.queries
      });
    }
    catch (err) {
      console.log("Error occurred while sending Get Employee GET request to server:", err.message);
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
      getID: '',
      returnedEmployee: null,
      queries: null,
      showSQL: false
    });

    // Remove was-validated class from form to reset its appearance
    const form = document.querySelector('#getFormHTML');
    form.classList.remove('was-validated');
  }

  handleCheckboxChange = async (event) => {
    this.setState({
      [event.target.name]: event.target.checked
    });
  };
  
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
                Something went wrong while processing your database request. Please try again or contact airport database assistance. <br />
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3 className="mt-3" >Get an Employee's Details</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="getFormHTML" onSubmit={this.handleSubmit} noValidate>
          
          <div className="form-group mb-3">
            <label className="sr-only" htmlFor="getEmployeeID">Employee ID</label>
            <input type="number" step="1" min="0" pattern="[0-9]+" className="form-control" id="getEmployeeID" value={this.state.getID} name="getID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please input a valid Employee ID.</div>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox1" name="showFirstName" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox1">First Name</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox2" name="showMInitial" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox2">Middle Initial</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox3" name="showLastName" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox3">Last Name</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox4" name="showID" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox4">Employee ID</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox5" name="showDOB" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox5">Date of Birth</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox6" name="showSSN" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox6">Social Security Number</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox7" name="showGender" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox7">Gender</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox8" name="showEmail" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox8">Email</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox10" name="showPhone" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox10">Phone</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox11" name="showStreetAddress" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox11">Street Address</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox12" name="showCity" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox12">City</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox13" name="showState" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox13">State</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox14" name="showZipCode" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox14">Zip Code</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox15" name="showCountry" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox15">Country</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox16" name="showJobTitle" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox16">Job Title</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox17" name="showDepartmentName" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox17">Department Name</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox18" name="showWeeklyHours" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox18">Weekly Hours</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox19" name="showHourlyWage" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox19">Hourly Wage</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox20" name="showAnnualBonus" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox20">Annual Bonus</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox21" name="showBenefitsAmount" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox21">Benefits Amount</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox22" name="showStockOptions" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox22">Stock Options</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox23" name="showHealthInsuranceProvider" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox23">Health Insurance Provider</label>
          </div>

          <div className="custom-control custom-checkbox">
            <input type="checkbox" className="custom-control-input" id="checkbox24" name="showRetirementPlanNumber" onChange={this.handleCheckboxChange} />
            <label className="custom-control-label mx-2" htmlFor="checkbox24">Retirement Plan Number</label>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>

        {this.state.returnedEmployee ? 
        <div>
          <h3 className="mt-4" >Employee Details:</h3>
          <table align="center" className="table mt-1 border" >
            <thead className="table-dark">
              <tr>
                <th scope="col">Employee Attribute</th>
                <th scope="col">Returned Value</th>
              </tr>
            </thead>
            <tbody>
              {this.state.returnedEmployee && this.state.returnedEmployee[0] && Object.keys(this.state.returnedEmployee[0]).map(responseKey => {
                let elem = null;
                if (this.state[this.db_to_state[responseKey]]) {
                  elem = (<tr key={responseKey + "_row_key"}>
                    <th scope="col">{responseKey}</th>
                    <th scope="col">{this.state.returnedEmployee[0][responseKey]}</th>
                  </tr>)
                }
                else {
                  elem = null
                }
                return elem
              })}
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

export default GetForm
