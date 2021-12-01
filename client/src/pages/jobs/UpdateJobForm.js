import React, { Component } from 'react';
import './jobForms.css'


class UpdateJobForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      editJobID: '',
      editJobTitle: '',
      editDepartmentID: '',
      editLocationID: '',
      editBenefitsPackageID: '',
      editWeeklyHours: '',
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
      throw new Error("Something went wrong; PUT Request to Database did not return results object.");
    }
    else if (!Array.isArray(body.rows)) {
      throw new Error("Something went wrong; PUT Request to Database returned results object that is not recognized by webpage.");
    }
  }

  handleSubmit = async (event) => {
    event.preventDefault();
    try {
      let body = { 
        job_title: this.state.editJobTitle, 
        department_id: this.state.editDepartmentID,
        location_id: this.state.editLocationID,
        benefits_package_id: this.state.editBenefitsPackageID,
        weekly_hours: this.state.editWeeklyHours,
      };

      for (let [key, value] of Object.entries(body)) {
        if (value==="") {
          delete body[key];
        }
      }
      // console.log("Updating job with ", body);
  
      const response = await fetch(`/job/${this.state.editJobID}`, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
      const responseBody = await response.json();

      this.assertValidDBResponse(responseBody);

      this.setState({
        returnedJob: responseBody.rows,
        queries: responseBody.queries
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
  }

  handleClear = async (event) => {
    this.setState({
      editJobID: '',
      editJobTitle: '',
      editDepartmentID: '',
      editLocationID: '',
      editBenefitsPackageID: '',
      editWeeklyHours: '',
      returnedJob: null,
      queries: null,
      showSQL: false
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
                Something went wrong while processing your database request, one of your inputs may have been invalid. Please check your inputs, especially inputted IDs! These need to be existing IDs in the database. Cross reference IDs by searching through other tables, and contact airport database assistance if necessary. <br />
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
              { this.state.returnedJob ? <div className="modal-body">
                Job with ID {this.state.returnedJob[0]["job_id"]} was updated. <br />
              </div> : <div></div>}
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeSuccessModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Update an Job's Information</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="updateFormHTML" onSubmit={this.handleSubmit} noValidate>

          <h5>Job to Update</h5>
          <div className="form-group">
            <label className="sr-only" htmlFor="inputJobID">Job ID</label>
            <input type="number" step="1" min="0"  pattern="[0-9]+" className="form-control" id="inputJobID" placeholder="0" value={this.state.editJobID} name="editJobID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid Job ID to update.</div>
          </div>

          <h5 className="mt-3" >Update Fields:</h5>
          <small className="form-text text-muted">Note: Only enter in fields that you want updated.</small>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputJobTitle">Job Title</label>
            <input type="text" pattern="[A-Za-z0-9-_ ]*" className="form-control" id="inputJobTitle" placeholder="Copilot" value={this.state.editJobTitle} name="editJobTitle" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid job title.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputDepartmentID">Department ID</label>
            <input type="number" step="1" min="0"  pattern="[0-9]*" className="form-control" id="inputDepartmentID" placeholder="0 (Needs to be an existing ID)" value={this.state.editDepartmentID} name="editDepartmentID" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid department ID.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputLocationID">Location ID</label>
            <input type="number" step="1" min="0"  pattern="[0-9]*" className="form-control" id="inputLocationID" placeholder="0 (Needs to be an existing ID)" value={this.state.editLocationID} name="editLocationID" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid location ID.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputBenefitsPackageID">Benefits Package ID</label>
            <input type="number" step="1" min="0"  pattern="[0-9]*" className="form-control" id="inputBenefitsPackageID" placeholder="0 (Needs to be an existing ID)" value={this.state.editBenefitsPackageID} name="editBenefitsPackageID" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid benefits package ID.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputWeeklyHours">Weekly Hours</label>
            <input type="number" step="1" min="0"  pattern="[0-9]*" className="form-control" id="inputWeeklyHours" placeholder="0 (Needs to be an existing ID)" value={this.state.editWeeklyHours} name="editWeeklyHours" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid weekly hours value.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
          </form>

          <button type="button" className="btn btn-outline-secondary mt-3 mx-3 mb-3" onClick={this.toggleSQL} >Toggle SQL</button>
          {this.state.showSQL ? 
          <div className="mb-5" >
            {this.state.queries.map((queryText, index) => (
              <span style={{whiteSpace: 'pre-wrap'}} key={index}>{queryText}<br/></span>
            ))}
          </div> : <div></div>}
      </div>
    );
  }
}

export default UpdateJobForm
