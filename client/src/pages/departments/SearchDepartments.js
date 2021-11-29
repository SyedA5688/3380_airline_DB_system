import React, { Component } from 'react';
import './departmentForms.css'


class SearchDepartmentsForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      searchBy: 'all',
      searchID: '',
      searchDepartmentName: '',
      searchDate: '',
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
        searchDepartmentName: '',
        searchDate: '',
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

      case "name":
        query = this.state.searchDepartmentName.trim();
        break;
      
      case "date":
        query = query = String(this.state.searchDate.trim());
        break;

      default:
        query = "";
    }

    console.log("Sending query:", query);
    
    try {
      const response = await fetch(`/department?q=${query}&searchBy=${this.state.searchBy}&page=${this.state.page}&sort=${this.state.sort}&order=${this.state.order}&limit=${this.state.limit}`);
      const body = await response.json();
      console.log("Body rows:", body.rows);

      this.assertValidGETResponse(body);
      this.setState({
        returnedDepartments: body.rows
      });
    }
    catch (e) {
      console.log("Error occurred while sending GET request to /department endpoint,", e);
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
      searchID: '',
      searchJobTitle: '',
      searchDepartment: '',
      searchLocation: '',
      returnedDepartments: null
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
      <input type="number" min="0" pattern="[0-9]+"  className="form-control" id="inputSearchID" placeholder="0" name="searchID" value={this.state.searchID} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please provide a valid department ID number.</div>
      <div className="valid-feedback">Valid department ID.</div>
    </div>
      )
    }
    else if (searchBy === "name") {
      return <div className="form-group">
        <input type="text" pattern="[A-Za-z ]+"  className="form-control" id="inputSearchJobTitle" placeholder="(e.g. Flight Crew)" name="searchDepartmentName" value={this.state.searchDepartmentName} onChange={this.handleChange} required />
        <div className="invalid-feedback">Please provide a valid department name.</div>
        <div className="valid-feedback">Valid department name.</div>
      </div>
    }
    else if (searchBy === "date") {
      return <div className="form-group">
      <input type="date" className="form-control" id="inputLeaveDate" name="searchDate" value={this.state.searchDate} onChange={this.handleChange} required />
      <div className="invalid-feedback">Please select a department creation date.</div>
      <div className="valid-feedback">Valid date.</div>
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

        <h3>Search Database for Departments</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="searchFormHTML" onSubmit={this.handleSubmit} noValidate>

          <div className="form-group mb-2" >
            <label className="sr-only" htmlFor="inputSearchBy">Search by:</label>
            <select name="searchBy" className="form-select " id="inputSearchBy" defaultValue="all" onChange={this.handleChange}>
              <option value="all">Get All Departments</option>
              <option value="id">Department ID</option>
              <option value="name">Department Name</option>
              <option value="date">Creation Date</option>
            </select>
          </div>
          {searchByInputElement}
            
          <div className="form-group mt-2" >
            <label className="sr-only" htmlFor="inputSortBy">Sort by:</label>
            <select name="sort" className="form-select" id="inputSortBy" defaultValue="id" onChange={this.handleChange}>
              <option value="id">Department ID</option>
              <option value="name">Department Name</option>
              <option value="date">Creation Date</option>
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

        {this.state.returnedDepartments ? <table align="center" className="table mt-5 border" >
          <thead className="table-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">Job Count</th>
              <th scope="col">Employee Count</th>
              <th scope="col">Department ID</th>
              <th scope="col">Department Name</th>
              <th scope="col">Creation Date</th>
              <th scope="col">Department Head ID</th>
              <th scope="col">First Name</th>
              <th scope="col">Last Name</th>
            </tr>
          </thead>
          
          <tbody>
            {this.state.returnedDepartments && this.state.returnedDepartments.map((deptObj, index) => (
              <tr key={deptObj.department_id}>
                <th scope="col">{index + 1}</th>
                <th scope="col">{deptObj.job_count}</th>
                <th scope="col">{deptObj.employee_count}</th>
                <th scope="col">{deptObj.department_id}</th>
                <th scope="col">{deptObj.department_name}</th>
                <th scope="col">{deptObj.creation_date}</th>
                <th scope="col">{deptObj.department_head_id}</th>
                <th scope="col">{deptObj.first_name}</th>
                <th scope="col">{deptObj.last_name}</th>
              </tr>
            ))}
          </tbody>
        </table> :
        <div></div>}
      </div>
    );
  }
}

export default SearchDepartmentsForm
