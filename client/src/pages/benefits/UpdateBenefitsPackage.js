import React, { Component } from 'react';
import './benefitsForm.css'


class UpdateBenefitsForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      benefitsPackageID: '',
      health_insurance_provider: '',
      amount: '',
      stock_options: '',
      retirement_plan: '',
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
        health_insurance_provider: this.state.health_insurance_provider, 
        amount: this.state.amount,
        stock_options: this.state.stock_options,
        retirement_plan: this.state.retirement_plan
      };

      for (let [key, value] of Object.entries(body)) {
        if (value==="") {
          delete body[key];
        }
      }
      // console.log("Updating department with ", body);
  
      const response = await fetch(`/benefits/${this.state.benefitsPackageID}`, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });

      const responseBody = await response.json();
      // console.log("Response Body:", responseBody);
      this.assertValidDBResponse(responseBody);

      this.setState({
        returnedBenefitPackage: responseBody.rows
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
      benefitsPackageID: '',
      health_insurance_provider: '',
      amount: '',
      stock_options: '',
      retirement_plan: '',
      returnedBenefitPackage: null
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
              { this.state.returnedBenefitPackage ? <div className="modal-body">
                Benefits Package with ID {this.state.benefitsPackageID} was updated. <br />
              </div> : <div></div>}
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeSuccessModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Update a Benefits Package:</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="updateFormHTML" onSubmit={this.handleSubmit} noValidate>

          <h5>Benefits Package to Update</h5>
          <div className="form-group">
            <label className="sr-only" htmlFor="inputBenefitsPackageID">Benefits Package ID</label>
            <input type="number" step="1" min="0"  pattern="[0-9]+" className="form-control" id="inputBenefitsPackageID" placeholder="(e.g. 0)" value={this.state.benefitsPackageID} name="benefitsPackageID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid department ID to update.</div>
          </div>

          <h5 className="mt-3" >Update Fields:</h5>
          <small className="form-text text-muted">Note: Only enter in fields that you want updated.</small>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputInsuranceProvider">Health Insurance Provider</label>
            <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputInsuranceProvider" placeholder="(e.g. AllState)" value={this.state.health_insurance_provider} name="health_insurance_provider" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid health insurance provider.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputPackageAmount">Amount</label>
            <input type="number" step="0.01" min="0"  pattern="[0-9]*" className="form-control" id="inputPackageAmount" placeholder="(e.g. 30000.00)" value={this.state.amount} name="amount" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid package amount.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputStockOptions">Stock Options</label>
          <input type="text" pattern="[A-Za-z ]*" className="form-control" id="inputStockOptions" placeholder="(e.g. NASDAQ)" value={this.state.stock_options} name="stock_options" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid stock options phrase.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputRetirementPlan">Retirement Plan</label>
            <input type="text" pattern="[A-Za-z0-9 ]*" className="form-control" id="inputRetirementPlan" placeholder="(e.g. 2065 Retirement Plus)" value={this.state.retirement_plan} name="retirement_plan" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide a valid retirement plan name.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
          </form>
      </div>
    );
  }
}

export default UpdateBenefitsForm
