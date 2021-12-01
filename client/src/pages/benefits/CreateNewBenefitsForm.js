import React, { Component } from 'react';
import './benefitsForm.css'


class CreateBenefitsForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      health_insurance_provider: '',
      amount: '',
      stock_options: '',
      retirement_plan: '',
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
        health_insurance_provider: this.state.health_insurance_provider, 
        amount: this.state.amount,
        stock_options: this.state.stock_options,
        retirement_plan: this.state.retirement_plan
      };
      // console.log("Sending creating new benefits package POST request with:", body);
  
      const response = await fetch("/benefits", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
  
      const responseBody = await response.json();
      // console.log("Response body:", responseBody);
      this.assertValidDBResponse(responseBody);
  
      this.setState({
        createdBenefitsPackage: responseBody.rows,
        queries: responseBody.queries
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
      health_insurance_provider: '',
      amount: '',
      stock_options: '',
      retirement_plan: '',
      createdDepartment: null,
      queries: null,
      showSQL: false
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

        <h3>Create New Benefits Package</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="createFormHTML" onSubmit={this.handleSubmit} noValidate>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputDepartmentName">Health Insurance Provider</label>
            <input type="text" pattern="[A-Za-z ]+" className="form-control" id="inputInsuranceProvider" placeholder="(e.g. AllState)" value={this.state.health_insurance_provider} name="health_insurance_provider" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid health insurance provider name.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputDepartmentHeadID">Amount</label>
            <input type="number" step="0.01" min="0" pattern="[0-9]*" className="form-control" id="inputPackageAmount" placeholder="(e.g. 5000.00)" value={this.state.amount} name="amount" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid package monetary amount.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputDepartmentName">Stock Options</label>
            <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputDepartmentName" placeholder="(e.g. NASDAQ)" value={this.state.stock_options} name="stock_options" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid stock options phrase.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputDepartmentName">Retirement Plan</label>
            <input type="text" pattern="[A-Za-z0-9 ]*" className="form-control" id="inputRetirementPlan" placeholder="(e.g. 2065 Retirement Plus)" value={this.state.retirement_plan} name="retirement_plan" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid retirement plan name.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>

        {this.state.createdBenefitsPackage ? 
        <div>
          <h3 className="mt-5 ">Created Benefits Package</h3>
          <table align="center" className="table border mt-3 mb-5" >
            <thead className="table-dark">
              <tr>
                <th scope="col">Benefits Package ID</th>
                <th scope="col">Amount</th>
                <th scope="col">Stock Options</th>
                <th scope="col">Health Insurance Provider</th>
                <th scope="col">Retirement Plan</th>
              </tr>
            </thead>
            
            <tbody>
              {this.state.createdBenefitsPackage && this.state.createdBenefitsPackage.map(benefitsObj => (
                <tr key={benefitsObj.benefits_package_id}>
                  <th scope="col">{benefitsObj.benefits_package_id}</th>
                  <th scope="col">{benefitsObj.amount}</th>
                  <th scope="col">{benefitsObj.stock_options}</th>
                  <th scope="col">{benefitsObj.health_insurance_provider}</th>
                  <th scope="col">{benefitsObj.retirement_plan}</th>
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

export default CreateBenefitsForm
