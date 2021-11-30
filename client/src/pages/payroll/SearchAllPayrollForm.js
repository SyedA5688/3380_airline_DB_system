import React, { Component } from 'react';
import './payrollForms.css'


class SearchPayrollForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      searchBy: 'all',
      searchID: '',
      searchPeriod: '',
      searchEmployee: '',
      searchIncome: '',
      page: 1,
      sort: 'id',
      order: 'asc',
      limit: 10
    };
    
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleClear = this.handleClear.bind(this);
  }

  handleChange = async (event) => {
    this.setState({
      [event.target.name]: event.target.value
    });

    if (event.target.name === "searchBy") {
      this.setState({
        searchID: '',
        searchPeriod: '',
        searchEmployee: '',
        searchIncome: ''
      });
      this.handleClear();
    }
  };

  componentDidMount() {
    this.listenForFormSubmission();
  }

  listenForFormSubmission() {
    const form = document.querySelector('#searchFormHTML');

    form.addEventListener('submit', (event) => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  }

  assertValidGETResponse(body) {
    if (!("rows" in body)) {
      throw new Error("Something went wrong; GET Request to Database did not return results object.");
    }
    else if (!Array.isArray(body.rows)) {
      throw new Error("Something went wrong; GET Request to Database returned results object that is not recognized by webpage.");
    }
  }

  handleSubmit = async (event) => {
    event.preventDefault();
    
    let query = "";
    switch(this.state.searchBy) {
      case "all":
        query = "";
        break;
      
      case "id": {
        query = this.state.searchID;
        break;
      }

      case "period":
        query = this.state.searchPeriod;
        break;
      
      case "employee":
        query = query = this.state.searchEmployee;
        break;

      case "income":
        query = query = this.state.searchIncome;
        break;

      default:
        query = "";
    }

    // console.log("Sending query:", query);
    
    try {
      const response = await fetch(`/payroll?q=${query}&searchBy=${this.state.searchBy}&page=${this.state.page}&sort=${this.state.sort}&order=${this.state.order}&limit=${this.state.limit}`);
      const body = await response.json();
      // console.log("Response Body rows:", body.rows);

      this.assertValidGETResponse(body);
      this.setState({
        returnedPayrollEntries: body.rows
      });
    }
    catch (e) {
      console.log("Error occurred while sending GET request to /payroll endpoint,", e);
      document.getElementById("errorModal").style.display = "block"
      document.getElementById("errorModal").classList.add("show")
    }

    const form = document.querySelector('#searchFormHTML');
    form.classList.remove('was-validated');
  };

  closeModal = () => {
    document.getElementById("errorModal").style.display = "none"
    document.getElementById("errorModal").classList.remove("show");
  }

  handleClear = async (event) => {
    this.setState({
      searchID: '',
      searchPeriod: '',
      searchEmployee: '',
      searchIncome: '',
      returnedBenefits: null
    });

    const form = document.querySelector('#searchFormHTML');
    form.classList.remove('was-validated');
  }

  SearchByInputElement(searchBy) {
    if (searchBy === "all") {
      return <div></div>
    }
    else if (searchBy === "id") {
      return (<div className="form-group">
      <input type="number" min="0" pattern="[0-9]+"  className="form-control" id="inputPackageID" placeholder="0" name="searchID" value={this.state.searchID} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please provide a valid benefits package ID number.</div>
      <div className="valid-feedback">Valid benefits package ID.</div>
    </div>
      )
    }
    else if (searchBy === "period") {
      return <div className="form-group">
      <input type="date" className="form-control" id="inputPayPeriod" name="searchPeriod" value={this.state.searchPeriod} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please select a valid pay period date.</div>
      <div className="valid-feedback">Valid pay period date.</div>
    </div>
    }
    else if (searchBy === "employee") {
      return <div className="form-group">
      <input type="number" min="0" step="1" pattern="[0-9.]+"  className="form-control" id="inputEmployeeID" placeholder="(e.g. 1000000)" name="searchEmployee" value={this.state.searchEmployee} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please provide a valid employee ID.</div>
      <div className="valid-feedback">Valid employee ID.</div>
    </div>
    }
    else if (searchBy === "income") {
      return <div className="form-group">
      <input type="number" min="0" step="0.01" pattern="[0-9.]+"  className="form-control" id="inputIncome" placeholder="(e.g. 2000.00)" name="searchIncome" value={this.state.searchIncome} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please provide a valid income amount.</div>
      <div className="valid-feedback">Valid benefits income amount.</div>
    </div>
    }
    else {
      return <div></div>
    }
  } 
  
  render() {
    let searchByInputElement = this.SearchByInputElement(this.state.searchBy)
    return (
      <div className="container mt-5 px-5">
        <div className="modal fade" id="errorModal" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title" id="exampleModalLabel">Error Occurred</h5>
              </div>
              <div className="modal-body">
                Something went wrong while processing your database request, please try again later. <br />

              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Search Database for Payroll Entries</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="searchFormHTML" onSubmit={this.handleSubmit} noValidate>

          <div className="form-group mb-2" >
            <label className="sr-only" htmlFor="inputSearchBy">Search by:</label>
            <select name="searchBy" className="form-select " id="inputSearchBy" defaultValue="all" onChange={this.handleChange}>
              <option value="all">Get All Payroll Entries</option>
              <option value="id">Payroll Entry ID</option>
              <option value="period">Pay Period</option>
              <option value="employee">Employee ID</option>
              <option value="income">Income</option>
            </select>
          </div>
          {searchByInputElement}
            
          <div className="form-group mt-2" >
            <label className="sr-only" htmlFor="inputSortBy">Sort by:</label>
            <select name="sort" className="form-select" id="inputSortBy" defaultValue="id" onChange={this.handleChange}>
              <option value="id">Payroll Entry ID</option>
              <option value="period">Pay Period</option>
              <option value="employee">Employee</option>
              <option value="gross">Gross income</option>
              <option value="net">Net income</option>
            </select>
          </div>

          <div className="form-group mt-2" >
            <label className="sr-only" htmlFor="inputOrderBy">Order:</label>
            <select name="order" className="form-select" id="inputOrderBy" defaultValue="asc" onChange={this.handleChange}>
              <option value="asc">Ascending</option>
              <option value="desc">Descending</option>
            </select>
          </div>

          <div className="input-group mt-3" >
            <div className="input-group-prepend">
              <span className="input-group-text" id="">Results per Page, Page Number</span>
            </div>
            <input type="number" min="1" className="form-control" id="inputSearchLimit" name="limit" value={this.state.limit} onChange={this.handleChange} />
            <input type="number" min="1" className="form-control" id="inputSearchPage" name="page" value={this.state.page} onChange={this.handleChange} />
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>

        {this.state.returnedPayrollEntries ? <table align="center" className="table mt-5 border" >
          <thead className="table-dark">
            <tr>
              <th scope="col">#</th>
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
            {this.state.returnedPayrollEntries && this.state.returnedPayrollEntries.map((payrollObj, index) => (
              <tr key={payrollObj.payroll_id}>
                <th scope="col">{index + 1}</th>
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
        </table> :
        <div></div>}
      </div>
    );
  }
}

export default SearchPayrollForm
