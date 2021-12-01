import React, { Component } from 'react';
import './leaveForms.css'


class InsertLeaveForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      insertEmployeeID: '',
      insertDate: '',
      insertReason: '',
      insertStatus: '',
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
        id: this.state.insertEmployeeID,
        date: this.state.insertDate, 
        reason: this.state.insertReason,
        status: this.state.insertStatus
      };
      // console.log("Sending inserting new employee POST request with:", body);
  
      const response = await fetch("/employee/" + String(this.state.insertEmployeeID) + '/leave', {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
  
      const responseBody = await response.json();
      // console.log(responseBody);
      this.assertValidDBResponse(responseBody);
  
      this.setState({
        insertedLeaveEntry: responseBody.rows,
        queries: responseBody.queries
      });
    }
    catch (err) {
      console.log("Error occurred while sending Insert Leave POST request to server:", err.message);
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
      insertEmployeeID: '',
      insertDate: '',
      insertReason: '',
      insertStatus: '',
      insertedLeaveEntry: null,
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

        <h3>Create New Leave Entry in Database</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="insertFormHTML" onSubmit={this.handleSubmit} noValidate>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeID">Employee ID</label>
            <input type="number" step="1" min="0" pattern="[0-9]+" className="form-control" id="inputEmployeeID" placeholder="1000000 (Must be an existing ID)" value={this.state.insertEmployeeID} name="insertEmployeeID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid employee ID.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputLeaveDate">Date</label>
            <input type="date" className="form-control" id="inputLeaveDate" value={this.state.insertDate} name="insertDate" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please select a date for the leave entry.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputLeaveStatus">Status</label>
            <input type="text" pattern="[A-Za-z-., ]+" className="form-control" id="inputLeaveStatus" placeholder="(e.g. Returned)" value={this.state.insertStatus} name="insertStatus" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid leave status.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputLeaveReason">Reason</label>
            <input type="text" pattern="[A-Za-z-_.,() ]+" className="form-control" id="inputLeaveReason" placeholder="(e.g. Doctor's appointment)" value={this.state.insertReason} name="insertReason" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid leave reason/description.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>

        {this.state.insertedLeaveEntry ? 
        <div>
          <h3 className="mt-5 ">New Leave Entry</h3>
          <table align="center" className="table border mt-3 mb-5" >
            <thead className="table-dark">
              <tr>
                <th scope="col">Leave ID</th>
                <th scope="col">Employee ID</th>
                <th scope="col">Date</th>
                <th scope="col">Reason</th>
                <th scope="col">Status</th>
              </tr>
            </thead>
            
            <tbody>
              {this.state.insertedLeaveEntry && this.state.insertedLeaveEntry.map(leaveObj => (
                <tr key={leaveObj.leave_id}>
                  <th scope="col">{leaveObj.leave_id}</th>
                  <th scope="col">{leaveObj.employee_id}</th>
                  <th scope="col">{leaveObj.date.split("T")[0]}</th>
                  <th scope="col">{leaveObj.reason}</th>
                  <th scope="col">{leaveObj.status}</th>
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

export default InsertLeaveForm
