import React, { Component } from 'react';
import './leaveForms.css'


class UpdateLeaveForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      editLeaveID: '',
      editLeaveDate: '',
      editLeaveReason: '',
      editLeaveStatus: '',
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
        date: this.state.editLeaveDate,
        reason: this.state.editLeaveReason,
        status: this.state.editLeaveStatus
      };

      for (let [key, value] of Object.entries(body)) {
        if (value==="") {
          delete body[key];
        }
      }
      // console.log("Updating leave with ", body);
  
      const response = await fetch(`/leave/${this.state.editLeaveID}`, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
      const responseBody = await response.json();
      // console.log("Server Response:", responseBody);

      this.assertValidDBResponse(responseBody);

      this.setState({
        returnedLeave: responseBody.rows,
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
      editLeaveID: '',
      editLeaveDate: '',
      editLeaveReason: '',
      editLeaveStatus: '',
      returnedLeave: null,
      queries: null,
      showSQL: false
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
                Something went wrong while processing your database request, one of your inputs may have been invalid. Please check your inputs, especially the leave ID! This needs to be an existing ID in the database. Cross reference IDs by searching through other tables, and contact airport database assistance if necessary. <br />
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
              { this.state.returnedLeave ? <div className="modal-body">
                Leave with ID {this.state.returnedLeave[0]["leave_id"]} was updated. <br />
              </div> : <div></div>}
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeSuccessModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Update an Leave Entry's Information</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="updateFormHTML" onSubmit={this.handleSubmit} noValidate>

          <h5>Leave Entry to Update</h5>
          <div className="form-group">
            <label className="sr-only" htmlFor="inputLeaveID">Leave ID</label>
            <input type="number" step="1" min="0"  pattern="[0-9]+" className="form-control" id="inputLeaveID" placeholder="0" value={this.state.editLeaveID} name="editLeaveID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid Job ID to update.</div>
          </div>

          <h5 className="mt-3" >Update Fields:</h5>
          <small className="form-text text-muted">Note: Only enter in fields that you want updated.</small>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputLeaveDate">Leave Date</label>
            <input type="date" className="form-control" id="inputLeaveDate" value={this.state.editLeaveDate} name="editLeaveDate" onChange={this.handleChange} />
            <div className="invalid-feedback">Please select a valid leave date.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputLeaveStatus">Status</label>
            <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputLeaveStatus" placeholder="(e.g. Returned)" value={this.state.editLeaveStatus} name="editLeaveStatus" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid status phrase. Only alphabetic characters allowed.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputLeaveReason">Reason</label>
            <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputLeaveReason" placeholder="(e.g. Doctor's Appointment)" value={this.state.editLeaveReason} name="editLeaveReason" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid reason/description. Only alphabetic characters allowed.</div>
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

export default UpdateLeaveForm
