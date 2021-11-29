import React, { Component } from 'react';
import './departmentForms.css'


class UpdateDepartmentForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      departmentID: '',
      updateDepartmentName: '',
      updateCreationDate: '',
      updateDepartmentHeadID: '',
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
        department_name: this.state.updateDepartmentName, 
        creation_date: this.state.updateCreationDate,
        department_head_id: this.state.updateDepartmentHeadID
      };

      for (let [key, value] of Object.entries(body)) {
        if (value==="") {
          delete body[key];
        }
      }
      // console.log("Updating department with ", body);
  
      const response = await fetch(`/department/${this.state.departmentID}`, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
      const responseBody = await response.json();

      this.assertValidDBResponse(responseBody);

      this.setState({
        returnedDepartment: responseBody.rows
      });

      document.getElementById("successModal").style.display = "block"
      document.getElementById("successModal").classList.add("show")
    }
    catch (err) {
      console.log("Error occurred while sending Update Department PUT request to server:", err.message);
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
      departmentID: '',
      updateDepartmentName: '',
      updateCreationDate: '',
      updateDepartmentHeadID: '',
      returnedDepartment: null
    });

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
              { this.state.returnedDepartment ? <div className="modal-body">
                Department with ID {this.state.departmentID} was updated. <br />
              </div> : <div></div>}
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeSuccessModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Update a Department's Information</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="updateFormHTML" onSubmit={this.handleSubmit} noValidate>

          <h5>Department to Update</h5>
          <div className="form-group">
            <label className="sr-only" htmlFor="inputDepartmentID">Department ID</label>
            <input type="number" step="1" min="0"  pattern="[0-9]+" className="form-control" id="inputDepartmentID" placeholder="0" value={this.state.departmentID} name="departmentID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid department ID to update.</div>
          </div>

          <h5 className="mt-3" >Update Fields:</h5>
          <small className="form-text text-muted">Note: Only enter in fields that you want updated.</small>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputDepartmentName">Department Name</label>
            <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputDepartmentName" placeholder="(e.g. Flight Crew)" value={this.state.updateDepartmentName} name="updateDepartmentName" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid department name.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputCreationDate">Creation Date</label>
            <input type="date" className="form-control" id="inputCreationDate" value={this.state.updateCreationDate} name="updateCreationDate" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid creation date.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputDepartmentHeadID">Department Head ID</label>
            <input type="number" step="1" min="0"  pattern="[0-9]*" className="form-control" id="inputDepartmentHeadID" placeholder="0 (Needs to be an existing ID)" value={this.state.updateDepartmentHeadID} name="updateDepartmentHeadID" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid department head ID.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
          </form>
      </div>
    );
  }
}

export default UpdateDepartmentForm
