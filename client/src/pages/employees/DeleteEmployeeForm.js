import React, { Component } from 'react';
import './employeeForms.css'


class DeleteEmployeeForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      id: ''
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
    const form = document.querySelector('#deleteFormHTML');

    form.addEventListener('submit', (event) => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  }

  assertValidDBResponse(body) {
    if (!("rowCount" in body)) {
      throw new Error("Something went wrong; DELETE Request to Database did not return results object.");
    }
  }

  handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const response = await fetch(`/employee/${this.state.id}`, {
        method: "DELETE",
        headers: {"Content-Type": "application/json"}
      });
  
      const responseBody = await response.json();
      // console.log("Response body:", responseBody);
      this.assertValidDBResponse(responseBody);
      
      if (responseBody["rowCount"] === 1) {
        this.setState({
          deletedEmployee: responseBody
        });
        
        document.getElementById("successModal").style.display = "block"
        document.getElementById("successModal").classList.add("show")
      }
      else {
        document.getElementById("errorModal").style.display = "block"
        document.getElementById("errorModal").classList.add("show")
      }
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

  closeSuccessModal = () => {
    document.getElementById("successModal").style.display = "none"
    document.getElementById("successModal").classList.remove("show");
    this.handleClear();
  }

  handleClear = async (event) => {
    this.setState({
      id: '',
      deletedEmployee: null
    });

    const form = document.querySelector('#deleteFormHTML');
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
                Something went wrong while processing your database request. Please check that the inputted Employee ID exists in the database. Contact airport database assistance if further problems persist. <br />
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
              { this.state.deletedEmployee ? <div className="modal-body">
                Employee with ID {this.state.id} was deleted. <br />
              </div> : <div></div>}
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeSuccessModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Delete an Employee</h3>
        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="deleteFormHTML" onSubmit={this.handleSubmit} noValidate>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeID">Employee ID</label>
            <input type="number" step="1" min="0" pattern="[0-9]+" className="form-control" id="inputEmployeeID" placeholder="(e.g. 1000000)" value={this.state.id} name="id" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide an existing employee ID.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>
      </div>
    );
  }
}

export default DeleteEmployeeForm
