import React, { Component } from 'react';
import './payrollForms.css'


class CreateAllPayrollForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      pay_period: '',
      tax_rate: '',
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
        pay_period: this.state.pay_period,
        tax_rate: this.state.tax_rate
      };
      // console.log("Sending creating new benefits package POST request with:", body);
  
      const response = await fetch("/payroll/all", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
  
      const responseBody = await response.json();
      // console.log("Response body:", responseBody);
      this.assertValidDBResponse(responseBody);
  
      this.setState({
        createdPayrollEntries: responseBody.rows
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
      pay_period: '',
      tax_rate: '',
      createdPayrollEntries: null
    });

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

        <h3>Create Payroll For All Employees</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="createFormHTML" onSubmit={this.handleSubmit} noValidate>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputPayPeriod">Pay Period</label>
            <input type="date" className="form-control" id="inputPayPeriod" value={this.state.pay_period} name="pay_period" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please select a valid pay period date.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputTaxRate">Tax Rate</label>
            <input type="number" step="0.01" min="0" pattern="[0-9]+" className="form-control" id="inputTaxRate" placeholder="(e.g. 0.10)" value={this.state.tax_rate} name="tax_rate" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid number of hours worked.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>

        {this.state.createdPayrollEntries ? 
        <div>
          <h3 className="mt-5 ">Created Payroll Entries</h3>
          <table align="center" className="table border mt-3 mb-5" >
            <thead className="table-dark">
              <tr>
                <th scope="col">Payroll ID</th>
                <th scope="col">Employee ID</th>
                <th scope="col">Hours Worked</th>
                <th scope="col">Pay Period</th>
                <th scope="col">Tax Rate</th>
                <th scope="col">Gross Income</th>
                <th scope="col">Taxed Income</th>
                <th scope="col">Net Income</th>
              </tr>
            </thead>
            
            <tbody>
              {this.state.createdPayrollEntries && this.state.createdPayrollEntries.map(payrollObj => (
                <tr key={payrollObj.payroll_id}>
                  <th scope="col">{payrollObj.payroll_id}</th>
                  <th scope="col">{payrollObj.employee_id}</th>
                  <th scope="col">{payrollObj.hours_worked}</th>
                  <th scope="col">{payrollObj.pay_period.split("T")[0]}</th>
                  <th scope="col">{payrollObj.tax_rate}</th>
                  <th scope="col">{payrollObj.gross_income}</th>
                  <th scope="col">{payrollObj.taxed_income}</th>
                  <th scope="col">{payrollObj.net_income}</th>
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

export default CreateAllPayrollForm
