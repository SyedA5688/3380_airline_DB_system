import React from 'react';
import { Outlet } from "react-router-dom";


class Navbar extends React.Component {
  constructor(props) {
    super(props);    
    this.handleInitializeDB = this.handleInitializeDB.bind(this);
    this.handleModalClose = this.handleModalClose.bind(this);
    this.handleModalContinue = this.handleModalContinue.bind(this);
    this.handleErrorModalClose = this.handleErrorModalClose.bind(this);
    this.handleSuccessModalClose = this.handleSuccessModalClose.bind(this);
  }

  handleInitializeDB = async (event) => {
    document.getElementById("initializeDBModal").style.display = "block"
    document.getElementById("initializeDBModal").classList.add("show")
  };

  handleModalClose = async (event) => {
    document.getElementById("initializeDBModal").style.display = "none"
    document.getElementById("initializeDBModal").classList.remove("show");
  };

  handleModalContinue = async (event) => {
    document.getElementById("initializeDBModal").style.display = "none"
    document.getElementById("initializeDBModal").classList.remove("show");
    try {
      console.log("Making DELETE request to /init endpoint.");

      const response = await fetch('/init', {
        method: "DELETE",
        headers: {"Content-Type": "application/json"},
      });
      const responseBody = await response.json();
      // console.log("Response body:", responseBody);

      if (responseBody.success === true) {
        console.log("Successfully reinitialized database.");
        document.getElementById("initializeDBSuccessModal").style.display = "block"
        document.getElementById("initializeDBSuccessModal").classList.add("show")
      }
      else {
        throw new Error("Failed to reinitialize database");
      }
    } 
    catch (error) {
      console.log("Error occurred while making DELETE request to /init endpoint:", error.message);
      document.getElementById("initializeDBErrorModal").style.display = "block"
      document.getElementById("initializeDBErrorModal").classList.add("show")
    }
  };

  handleErrorModalClose = async (event) => {
    document.getElementById("initializeDBErrorModal").style.display = "none"
    document.getElementById("initializeDBErrorModal").classList.remove("show");
  };

  handleSuccessModalClose = async (event) => {
    document.getElementById("initializeDBSuccessModal").style.display = "none"
    document.getElementById("initializeDBSuccessModal").classList.remove("show");
  };

  render() {
    return (
      <div className="navbar-page-container" >
        <div className="modal fade" id="initializeDBModal" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title" >Warning</h5>
              </div>
              <div className="modal-body">
                Are you sure you want to continue? This will delete all current database data and reinitialize all relations in the database to their starting state with prepopulated data. This will take several seconds to complete.
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.handleModalClose} >Cancel</button>
                <button type="button" className="btn btn-primary" onClick={this.handleModalContinue} >Continue</button>
              </div>
            </div>
          </div>
        </div>

        <div className="modal fade" id="initializeDBErrorModal" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title" id="exampleModalLabel">Error Occurred</h5>
              </div>
              <div className="modal-body">
                Something went wrong with the request, system was not able to delete and recreate the database. <br />
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.handleErrorModalClose} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <div className="modal fade" id="initializeDBSuccessModal" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title" >Success</h5>
              </div>
              <div className="modal-body">
                The database was successfully reset to its starting state with pre-populated data.
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.handleSuccessModalClose} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <nav className="navbar navbar-dark bg-dark navbar-expand-lg">
          <div className="container-fluid">
            <a className="navbar-brand mx-4" href="/">Airline HR Database System</a>
            <button className="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation" >
              <span className="navbar-toggler-icon"></span>
            </button>

            <div className="collapse navbar-collapse" id="navbarNav">
              <ul className="navbar-nav">
                <li className="nav-item">
                  <a className="nav-link" href="/employees/search">Employees</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/jobs/search">Jobs</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/department/search">Departments</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/leave/search">Leave</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/benefits/search">Benefits</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/payroll/search">Payroll</a>
                </li>
              </ul>
              <ul className="navbar-nav ms-auto">
                <button type="button" className="btn btn-outline-secondary" onClick={this.handleInitializeDB} >Initialize DB</button>
                <li className="nav-item">
                  <a className="nav-link" target="_blank" rel="noreferrer" href="https://syedarizvi.com/team07.pdf">PDF</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" target="_blank" rel="noreferrer" href="https://www.youtube.com/watch?v=K2cJQ1I8Hcc">Demo</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" target="_blank" rel="noreferrer" href="https://github.com/SyedA5688/3380_airline_DB_system#3380_airline_system_project">ReadME</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div className="page-container" >
          <Outlet />
        </div>
      </div>
    )
  }
}

export default Navbar
