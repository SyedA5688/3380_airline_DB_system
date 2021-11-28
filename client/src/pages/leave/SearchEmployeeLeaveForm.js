import React, { Component } from 'react';
import './leaveForms.css'


class SearchEmployeeLeaveForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      employeeID: '',
      searchBy: 'all',
      searchText: '',
      searchID: '',
      searchDate: '',
      searchStatus: '',
      searchReason: '',
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
        searchText: '',
        searchID: '',
        searchDate: '',
        searchStatus: '',
        searchReason: '',
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
      
      case "text":
        query = this.state.searchText.trim();
        break;
      
      case "id": {
        query = this.state.searchID;
        break;
      }

      case "date":
        query = String(this.state.searchDate.trim());
        break;
      
      case "status":
        query = this.state.searchStatus.trim();
        break;
        
      case "reason":
        query = this.state.searchReason.trim();
        break;

      default:
        query = "";
    }
    
    try {
      const response = await fetch(`/employee/${this.state.employeeID}/leave?q=${query}&searchBy=${this.state.searchBy}&page=${this.state.page}&sort=${this.state.sort}&order=${this.state.order}&limit=${this.state.limit}`);
      const body = await response.json();
      // console.log("Response body rows:", body.rows);

      this.assertValidGETResponse(body);
      this.setState({
        returnedLeaves: body.rows
      });
    }
    catch (e) {
      console.log("Error occurred while sending GET request to /employee/:id/leave endpoint,", e);
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
      searchText: '',
      searchID: '',
      searchDate: '',
      searchStatus: '',
      searchReason: '',
      returnedLeaves: null
    });

    const form = document.querySelector('#searchFormHTML');
    form.classList.remove('was-validated');
  }

  SearchByInputElement(searchBy) {
    if (searchBy === "all") {
      return <div></div>
    }
    else if (searchBy === "text") {
      return (<div className="form-group">
      <input type="text" pattern="[A-Za-z0-9-_ ]+"  className="form-control" id="inputLeaveText" placeholder="Any text in leave status or reason description" name="searchText" value={this.state.searchText} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please provide a valid search text.</div>
      <div className="valid-feedback">Valid search text.</div>
    </div>)
    }
    else if (searchBy === "id") {
      return (<div className="form-group">
      <input type="number" min="0" pattern="[0-9]+"  className="form-control" id="inputLeaveID" placeholder="0" name="searchID" value={this.state.searchID} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please provide a valid leave ID.</div>
      <div className="valid-feedback">Valid leave ID number.</div>
    </div>)
    }
    else if (searchBy === "date") {
      return <div className="form-group">
        <input type="date" className="form-control" id="inputLeaveDate" name="searchDate" value={this.state.searchDate} onChange={this.handleChange} required />
        <div className="invalid-feedback">Please provide a valid leave date.</div>
        <div className="valid-feedback">Valid leave date.</div>
      </div>
    }
    else if (searchBy === "status") {
      return <div className="form-group">
      <input type="text" pattern="[A-Za-z0-9-_ ]+"  className="form-control" id="inputLeaveStatus" placeholder="(e.g. Returned)" name="searchStatus" value={this.state.searchStatus} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please provide valid status text to search.</div>
      <div className="valid-feedback">Valid status text.</div>
    </div>
    }
    else if (searchBy === "reason") {
      return <div className="form-group">
      <input type="text" pattern="[A-Za-z0-9-_ ]+"  className="form-control" id="inputLeaveReason" placeholder="(e.g. Doctor appointment on January 1st, 2021)" name="searchReason" value={this.state.searchReason} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please provide valid reason text to search.</div>
      <div className="valid-feedback">Valid reason text.</div>
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

        <h3>Search Through an Employee's Leave Entries</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="searchFormHTML" onSubmit={this.handleSubmit} noValidate>

          <h5 className="mb-2" >Employee to Query Leave Entries For:</h5>
          <div className="form-group">
            <label className="sr-only" htmlFor="inputEmployeeID">Employee ID</label>
            <input type="number" step="1" min="0"  pattern="[0-9]+" className="form-control" id="inputEmployeeID" placeholder="1000000" value={this.state.employeeID} name="employeeID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid existing employee ID.</div>
          </div>

          <h5 className="mt-4" >Leave Entry Parameters:</h5>
          <div className="form-group mb-2" >
            <label className="sr-only" htmlFor="inputSearchBy">Search by:</label>
            <select name="searchBy" className="form-select " id="inputSearchBy" defaultValue="all" onChange={this.handleChange}>
              <option value="all">Get All Leave Entries</option>
              <option value="text">Leave General Text</option>
              <option value="id">Leave Entry ID</option>
              <option value="date">Date</option>
              <option value="status">Leave Status</option>
              <option value="reason">Leave Reason/Description</option>
            </select>
          </div>
          {searchByInputElement}
            
          <div className="form-group mt-2" >
            <label className="sr-only" htmlFor="inputSortBy">Sort by:</label>
            <select name="sort" className="form-select" id="inputSortBy" defaultValue="id" onChange={this.handleChange}>
              <option value="id">Employee ID</option>
              <option value="name">Name</option>
              <option value="title">Job Title</option>
              <option value="department">Department</option>
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

        {this.state.returnedLeaves ? <table align="center" className="table mt-5 border" >
          <thead className="table-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">Leave ID</th>
              <th scope="col">Employee ID</th>
              <th scope="col">Date</th>
              <th scope="col">Reason</th>
              <th scope="col">Status</th>
            </tr>
          </thead>
          
          <tbody>
            {this.state.returnedLeaves && this.state.returnedLeaves.map((leaveObj, index) => (
              <tr key={leaveObj.leave_id}>
                <th scope="col">{index + 1}</th>
                <th scope="col">{leaveObj.leave_id}</th>
                <th scope="col">{leaveObj.employee_id}</th>
                <th scope="col">{leaveObj.date}</th>
                <th scope="col">{leaveObj.reason}</th>
                <th scope="col">{leaveObj.status}</th>
              </tr>
            ))}
          </tbody>
        </table> :
        <div></div>}
      </div>
    );
  }
}

export default SearchEmployeeLeaveForm
