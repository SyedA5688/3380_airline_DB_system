import React, { Component } from 'react';
import './departmentForms.css'


class CreateDepartmentForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      createDepartmentName: '',
      createDepartmentDate: '',
      createDepartmentHeadID: '',
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
    const form = document.querySelector('#createFormHTML');

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
      throw new Error("Something went wrong; POST Request to Database did not return results object.");
    }
    else if (!Array.isArray(body.rows)) {
      throw new Error("Something went wrong; POST Request to Database returned results object that is not recognized by webpage.");
    }
  }

  handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const body = { 
        department_name: this.state.createDepartmentName, 
        creation_date: this.state.createDepartmentDate,
        department_head_id: this.state.createDepartmentHeadID
      };
      // console.log("Sending creating new department POST request with:", body);
  
      const response = await fetch("/department", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
  
      const responseBody = await response.json();
      // console.log("Response:", responseBody);
      this.assertValidDBResponse(responseBody);
  
      this.setState({
        createdDepartment: responseBody.rows
      });
    }
    catch (err) {
      console.log("Error occurred while sending create Department POST request to server:", err.message);
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
      createDepartmentName: '',
      createDepartmentDate: '',
      createDepartmentHeadID: '',
      createdDepartment: null
    });

    // Remove was-validated class from form to reset its appearance
    const form = document.querySelector('#createFormHTML');
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
                Something went wrong while processing your database request. Please try again and check your form inputs, especially Department Head ID! Contact airport database assistance if further problems persist. <br />
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Create New Department</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="createFormHTML" onSubmit={this.handleSubmit} noValidate>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputDepartmentName">Department Name</label>
            <input type="text" pattern="[A-Za-z ]+" className="form-control" id="inputDepartmentName" placeholder="(e.g. Flight Personnel)" value={this.state.createDepartmentName} name="createDepartmentName" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid department name.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputCreationDate">Creation Date</label>
            <input type="date" className="form-control" id="inputCreationDate" name="createDepartmentDate" value={this.state.createDepartmentDate} onChange={this.handleChange} required />
            <div className="invalid-feedback">Please select a valid creation date.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputDepartmentHeadID">Department Head ID</label>
            <input type="number" step="1" min="0" pattern="[0-9]+" className="form-control" id="inputDepartmentHeadID" placeholder="1000000 (Must be an existing ID)" value={this.state.createDepartmentHeadID} name="createDepartmentHeadID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid department ID.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>

        {this.state.createdDepartment ? 
        <div>
          <h3 className="mt-5 ">Created Department</h3>
          <table align="center" className="table border mt-3 mb-5" >
            <thead className="table-dark">
              <tr>
                <th scope="col">Department ID</th>
                <th scope="col">Department Name</th>
                <th scope="col">Creation Date</th>
                <th scope="col">Department Head ID</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
              </tr>
            </thead>
            
            <tbody>
              {this.state.createdDepartment && this.state.createdDepartment.map(deptObj => (
                <tr key={deptObj.department_id}>
                  <th scope="col">{deptObj.department_id}</th>
                  <th scope="col">{deptObj.department_name}</th>
                  <th scope="col">{deptObj.creation_date}</th>
                  <th scope="col">{deptObj.department_head_id}</th>
                  <th scope="col">{deptObj.first_name}</th>
                  <th scope="col">{deptObj.last_name}</th>
                </tr>
              ))}
            </tbody>
          </table>
        </div>:
        <div></div>}
      </div>
    );
  }
}

export default CreateDepartmentForm
