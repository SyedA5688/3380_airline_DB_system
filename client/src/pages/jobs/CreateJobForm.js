import React, { Component } from 'react';
import './jobForms.css'


class InsertJobForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      insertJobTitle: '',
      insertDepartmentID: '',
      insertLocationID: '',
      insertBenefitsPackageID: '',
      insertWeeklyHours: '',
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
        job_title: this.state.insertJobTitle, 
        department_id: this.state.insertDepartmentID,
        location_id: this.state.insertLocationID,
        benefits_package_id: this.state.insertBenefitsPackageID,
        weekly_hours: this.state.insertWeeklyHours
      };
      // console.log("Sending inserting new employee POST request with:", body);
  
      const response = await fetch("/job", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
  
      const responseBody = await response.json();
      // console.log(responseBody);
      this.assertValidDBResponse(responseBody);
  
      this.setState({
        insertedJob: responseBody.rows,
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
      insertJobTitle: '',
      insertDepartmentID: '',
      insertLocationID: '',
      insertBenefitsPackageID: '',
      insertWeeklyHours: '',
      insertedJob: null,
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

          <div className="form-group">
            <label className="sr-only" htmlFor="inputJobTitle">Job Title</label>
            <input type="text" pattern="[A-Za-z ]+" className="form-control" id="inputJobTitle" placeholder="Pilot" value={this.state.insertJobTitle} name="insertJobTitle" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid job title.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputDepartmentID">Department ID</label>
            <input type="number" step="1"  pattern="[0-9]+" className="form-control" id="inputDepartmentID" placeholder="0 (Must be an existing ID)" value={this.state.insertDepartmentID} name="insertDepartmentID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid department ID.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputJobLocationID">Location ID</label>
            <input type="number" step="1"  pattern="[0-9]+" className="form-control" id="inputEmployeeManagerID" placeholder="0 (Must be an existing ID)" value={this.state.insertLocationID} name="insertLocationID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid location ID.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputJobBenefitsPackageID">Benefits Package ID</label>
            <input type="number" step="1"  pattern="[0-9]+" className="form-control" id="inputJobBenefitsPackageID" placeholder="0 (Must be an existing ID)" value={this.state.insertBenefitsPackageID} name="insertBenefitsPackageID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide valid Benefits Package ID.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputJobWeeklyHours">Weekly Hours (Optional)</label>
            <input type="number" step="1"  pattern="[0-9]*" className="form-control" id="inputJobWeeklyHours" placeholder="40" value={this.state.insertWeeklyHours} name="insertWeeklyHours" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid weekly hours value.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>

        {this.state.insertedJob ? 
        <div>
          <h3 className="mt-5 ">Inserted Job</h3>
          <table align="center" className="table border mt-3 mb-5" >
            <thead className="table-dark">
              <tr>
                <th scope="col">Job ID</th>
                <th scope="col">Job Title</th>
                <th scope="col">Department ID</th>
                <th scope="col">Department Name</th>
                <th scope="col">Location ID</th>
                <th scope="col">Weekly Hours</th>
                <th scope="col">Benefits Package ID</th>
              </tr>
            </thead>
            
            <tbody>
              {this.state.insertedJob && this.state.insertedJob.map(jobObj => (
                <tr key={jobObj.job_id}>
                  <th scope="col">{jobObj.job_id}</th>
                  <th scope="col">{jobObj.job_title}</th>
                  <th scope="col">{jobObj.department_id}</th>
                  <th scope="col">{jobObj.department_name}</th>
                  <th scope="col">{jobObj.location_id}</th>
                  <th scope="col">{jobObj.weekly_hours}</th>
                  <th scope="col">{jobObj.benefits_package_id}</th>
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

export default InsertJobForm
