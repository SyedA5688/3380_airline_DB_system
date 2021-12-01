import React, { Component } from 'react';
import './benefitsForm.css'


class SearchBenefitsForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      searchBy: 'all',
      searchText: '',
      searchID: '',
      searchAmount: '',
      searchStock: '',
      searchProvider: '',
      searchRetirement: '',
      page: 1,
      sort: 'id',
      order: 'asc',
      limit: 10,
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

    if (event.target.name === "searchBy") {
      this.setState({
        searchText: '',
        searchID: '',
        searchAmount: '',
        searchStock: '',
        searchProvider: '',
        searchRetirement: '',
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
      
      case "text": {
        query = this.state.searchText.trim();
        break;
      }
      
      case "id": {
        query = this.state.searchID;
        break;
      }

      case "amount":
        query = this.state.searchAmount.trim();
        break;
      
      case "stock":
        query = query = String(this.state.searchStock.trim());
        break;

      case "provider":
        query = query = String(this.state.searchProvider.trim());
        break;

      case "retirement":
        query = query = String(this.state.searchRetirement.trim());
        break;

      default:
        query = "";
    }

    // console.log("Sending query:", query);
    
    try {
      const response = await fetch(`/benefits?q=${query}&searchBy=${this.state.searchBy}&page=${this.state.page}&sort=${this.state.sort}&order=${this.state.order}&limit=${this.state.limit}`);
      const body = await response.json();
      // console.log("Response Body rows:", body.rows);

      this.assertValidGETResponse(body);
      this.setState({
        returnedBenefits: body.rows,
        queries: body.queries
      });
    }
    catch (e) {
      console.log("Error occurred while sending GET request to /benefits endpoint,", e);
      document.getElementById("errorModal").style.display = "block"
      document.getElementById("errorModal").classList.add("show")
    }

    // Remove was-validated class from form to reset its appearance
    const form = document.querySelector('#searchFormHTML');
    form.classList.remove('was-validated');
  };

  closeModal = () => {
    document.getElementById("errorModal").style.display = "none"
    document.getElementById("errorModal").classList.remove("show");
  }

  handleClear = async (event) => {
    this.setState({
      searchText: '',
      searchID: '',
      searchAmount: '',
      searchStock: '',
      searchProvider: '',
      searchRetirement: '',
      returnedBenefits: null,
      queries: null,
      showSQL: false
    });

    const form = document.querySelector('#searchFormHTML');
    form.classList.remove('was-validated');
  }

  SearchByInputElement(searchBy) {
    if (searchBy === "all") {
      return <div></div>
    }
    else if (searchBy === "text") {
      return <div className="form-group">
        <input type="text" pattern="[A-Za-z ]+"  className="form-control" id="inputBenefitsText" placeholder="(e.g. Entry Level Plan)" name="searchText" value={this.state.searchText} onChange={this.handleChange} required />
        <div className="invalid-feedback">Please provide a valid text phrase.</div>
        <div className="valid-feedback">Valid text.</div>
      </div>
    }
    else if (searchBy === "id") {
      return (<div className="form-group">
      <input type="number" min="0" pattern="[0-9]+"  className="form-control" id="inputPackageID" placeholder="0" name="searchID" value={this.state.searchID} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please provide a valid benefits package ID number.</div>
      <div className="valid-feedback">Valid benefits package ID.</div>
    </div>
      )
    }
    else if (searchBy === "amount") {
      return <div className="form-group">
      <input type="number" min="0" step="0.01" pattern="[0-9.]+"  className="form-control" id="inputPackageAmount" placeholder="2000.00" name="searchAmount" value={this.state.searchAmount} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please provide a valid benefits package amount.</div>
      <div className="valid-feedback">Valid benefits package amount.</div>
    </div>
    }
    else if (searchBy === "stock") {
      return <div className="form-group">
        <input type="text" pattern="[A-Za-z ]+"  className="form-control" id="inputPackageStock" placeholder="(e.g. NASDAQ)" name="searchStock" value={this.state.searchStock} onChange={this.handleChange} required />
        <div className="invalid-feedback">Please provide a valid stock option phrase.</div>
        <div className="valid-feedback">Valid stock option phrase.</div>
      </div>
    }
    else if (searchBy === "provider") {
      return <div className="form-group">
        <input type="text" pattern="[A-Za-z ]+"  className="form-control" id="inputInsuranceProvider" placeholder="(e.g. AllState)" name="searchProvider" value={this.state.searchProvider} onChange={this.handleChange} required />
        <div className="invalid-feedback">Please provide a valid insurance provider.</div>
        <div className="valid-feedback">Valid insurance provider.</div>
      </div>
    }
    else if (searchBy === "retirement") {
      return <div className="form-group">
        <input type="text" pattern="[A-Za-z ]+"  className="form-control" id="inputRetirement" placeholder="(e.g. 2065 Retirement Plus)" name="searchRetirement" value={this.state.searchRetirement} onChange={this.handleChange} required />
        <div className="invalid-feedback">Please provide a valid retirement plan title.</div>
        <div className="valid-feedback">Valid retirement plan title.</div>
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

        <h3>Search Database for Benefits Packages</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="searchFormHTML" onSubmit={this.handleSubmit} noValidate>

          <div className="form-group mb-2" >
            <label className="sr-only" htmlFor="inputSearchBy">Search by:</label>
            <select name="searchBy" className="form-select " id="inputSearchBy" defaultValue="all" onChange={this.handleChange}>
              <option value="all">Get All Departments</option>
              <option value="text">Benefits Package Text</option>
              <option value="id">Benefits Package ID</option>
              <option value="amount">Amount</option>
              <option value="stock">Stock</option>
              <option value="provider">Provider</option>
              <option value="retirement">Retirement</option>
            </select>
          </div>
          {searchByInputElement}
            
          <div className="form-group mt-2" >
            <label className="sr-only" htmlFor="inputSortBy">Sort by:</label>
            <select name="sort" className="form-select" id="inputSortBy" defaultValue="id" onChange={this.handleChange}>
              <option value="id">Benefits Package ID</option>
              <option value="amount">Amount</option>
              <option value="stock">Stock</option>
              <option value="provider">Provider</option>
              <option value="retirement">Retirement</option>
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

        {this.state.returnedBenefits ? 
        <div>
          <table align="center" className="table mt-5 border" >
            <thead className="table-dark">
              <tr>
                <th scope="col">#</th>
                <th scope="col">Benefits Package ID</th>
                <th scope="col">Amount</th>
                <th scope="col">Stock Options</th>
                <th scope="col">Health Insurance Provider</th>
                <th scope="col">Retirement Plan</th>
              </tr>
            </thead>
            
            <tbody>
              {this.state.returnedBenefits && this.state.returnedBenefits.map((benefitsObj, index) => (
                <tr key={benefitsObj.benefits_package_id	}>
                  <th scope="col">{index + 1}</th>
                  <th scope="col">{benefitsObj.benefits_package_id}</th>
                  <th scope="col">{benefitsObj.amount}</th>
                  <th scope="col">{benefitsObj.stock_options}</th>
                  <th scope="col">{benefitsObj.health_insurance_provider}</th>
                  <th scope="col">{benefitsObj.retirement_plan}</th>
                  <th scope="col">{benefitsObj.department_head_id}</th>
                  <th scope="col">{benefitsObj.first_name}</th>
                  <th scope="col">{benefitsObj.last_name}</th>
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
        </div> :
        <div></div>}
      </div>
    );
  }
}

export default SearchBenefitsForm
