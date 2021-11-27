import React, { Component } from 'react';
import './employeeForms.css'


class GetForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      getID: ''
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
      console.log(responseBody);

      this.setState({
        returnedEmployee: responseBody.rows
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
      returnedEmployee: null
    });

    // Remove was-validated class from form to reset its appearance
    const form = document.querySelector('#getFormHTML');
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
                Something went wrong while processing your database request. Please try again or contact airport database assistance. <br />
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Get an Employee's Details</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="getFormHTML" onSubmit={this.handleSubmit} noValidate>
          
          <div className="form-group">
            <label className="sr-only" htmlFor="getEmployeeID">Employee ID</label>
            <input type="number" step="1" pattern="[0-9]+" className="form-control" id="getEmployeeID" value={this.state.getID} name="getID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please input a valid Employee ID.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>

        {this.state.returnedEmployee ? 
        <div>
          <h3>Employee Details:</h3>
          <table align="center" className="table mt-5 border" >
            <thead className="table-dark">
              <tr>
                <th scope="col">Employee ID</th>
                <th scope="col">Employee Address</th>
                <th scope="col">Job</th>
                <th scope="col">Department</th>
                <th scope="col">Benefits</th>
                <th scope="col">Salary</th>
              </tr>
            </thead>
            <tbody>
              {this.state.returnedEmployee && this.state.returnedEmployee.map(employeeObj => (
                <tr key={employeeObj.employee_id}>
                  <th scope="col">{employeeObj.first_name}</th>
                  <th scope="col">{employeeObj.last_name}</th>
                  <th scope="col">{employeeObj.m_initial}</th>
                  <th scope="col">{employeeObj.employee_id}</th>
                  <th scope="col">{employeeObj.job_title}</th>
                  <th scope="col">{employeeObj.department_name}</th>
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

export default GetForm
