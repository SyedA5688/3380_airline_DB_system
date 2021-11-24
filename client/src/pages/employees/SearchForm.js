import React, { Component } from 'react';
import './employeeForms.css'


class SearchForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      searchBy: 'all',
      searchFirstName: '',
      searchMiddleInitial: '',
      searchLastName: '',
      searchID: '',
      searchTitle: '',
      searchDepartment: '',
      sort: 'id',
      order: 'asc',
      limit: 10,
      page: 1,
    };
    
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange = async (event) => {
    this.setState({
      [event.target.name]: event.target.value
    });

    if (event.target.name === "searchBy") {
      this.setState({
        searchFirstName: '',
        searchMiddleInitial: '',
        searchLastName: '',
        searchID: '',
        searchTitle: '',
        searchDepartment: '',
      });
    }
  };

  checkInput() {  // look up input validation
    let validInput = true;
    // throw new Error("Invalid input:"...)
    return validInput;
  }

  assertValidGETResponse(body) {
    if (!("rows" in body)) {
      throw new Error("GET assertion failed, response returned by GET request to /employees has no rows attribute");
    }
    else if (!Array.isArray(body.rows)) {
      throw new Error("GET assertion failed, rows attribute returned by GET request to /employees is not an Array");
    }
  }

  handleSubmit = async (event) => {
    event.preventDefault();
    // TODO implement input validation
    this.checkInput();

    let query = "";
    if (this.state.searchBy === "all") {
      query = "";
    }
    else if (this.state.searchBy === "name") {
      query = "";
      if (this.state.searchFirstName !== "") {
        query += this.state.searchFirstName.trim();
      }
      if (this.state.searchMiddleInitial !== "") {
        query += " " + this.state.searchMiddleInitial.trim();
      }
      if (this.state.searchLastName !== "") {
        query += " " + this.state.searchLastName.trim();
      }
      query = query.trim();
    }
    else if (this.state.searchBy === "id") {
      query = this.state.searchID;
    }
    else if (this.state.searchBy === "title") {
      query = this.state.searchTitle.trim();
    }
    else if (this.state.searchBy === "department") {
      query = this.state.searchDepartment.trim();
    }
    else {
      query = "";
    }
    // console.log("State:", this.state);
    // console.log("Query", query);

    try {
      const response = await fetch(`/employee?q=${query}&searchBy=${this.state.searchBy}&page=${this.state.page}&sort=${this.state.sort}&order=${this.state.order}&limit=${this.state.limit}`);
      const body = await response.json();

      // Currently just logging the results. Later display as a table or form, etc
      this.assertValidGETResponse(body);
      // console.log("Body:", body);
      console.log("Rows:", body.rows);

      this.setState({
        returnedEmployees: body.rows
      });
    }
    catch (e) {
      console.log("Error occured while sending GET request to /employee endpoint,", e)
      //TODO: Error popup if an error occurred. May be invalid input, or exception returned from GET request. Show error message in popup
    }
  };

  SearchByInputElement(searchBy) {
    if (searchBy === "all") {
      return <div></div>
    }
    else if (searchBy === "name") {
      return (
        <div className="input-group" >
          <div className="input-group-prepend">
            <span className="input-group-text" id="">First, MI, Last</span>
          </div>
          <input type="text" className="form-control" id="inputSearchFirstName" placeholder="John (Optional)" name="searchFirstName" value={this.state.searchFirstName} onChange={this.handleChange} />
          <input type="text" className="form-control" id="inputSearchMiddleInitial" placeholder="M (Optional)" name="searchMiddleInitial" value={this.state.searchMiddleInitial} onChange={this.handleChange} />
          <input type="text" className="form-control" id="inputSearchLastName" placeholder="Doe (Optional)" name="searchLastName" value={this.state.searchLastName} onChange={this.handleChange} />
        </div>
      )
    }
    else if (searchBy === "id") {
      return <div className="form-group">
        {/* <label className="sr-only" htmlFor="inputSearchID">Employee ID</label> */}
        <input type="number" className="form-control" id="inputSearchID" placeholder="(e.g. 1000003)" name="searchID" value={this.state.searchID} onChange={this.handleChange} />
      </div>
    }
    else if (searchBy === "title") {
      return <div className="form-group">
        {/* <label className="sr-only" htmlFor="inputSearchTitle">Job Title</label> */}
        <input type="text" className="form-control" id="inputSearchTitle" placeholder="(e.g. Pilot)" name="searchTitle" value={this.state.searchTitle} onChange={this.handleChange} />
      </div>
    }
    else if (searchBy === "department") {
      return <div className="form-group">
        {/* <label className="sr-only" htmlFor="inputSearchDepartment">Department</label> */}
        <input type="text" className="form-control" id="inputSearchDepartment" placeholder="(e.g. Flight Crew)" name="searchDepartment" value={this.state.searchDepartment} onChange={this.handleChange} />
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
        <h3>Search Database for Employee(s)</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded" onSubmit={this.handleSubmit}>

          <div className="form-group mb-2" >
            <label className="sr-only" htmlFor="inputSearchBy">Search by:</label>
            <select name="searchBy" className="form-select " id="inputSearchBy" defaultValue="all" onChange={this.handleChange}>
              <option value="all">Get All Employees</option>
              <option value="name">Name</option>
              <option value="id">Employee ID</option>
              <option value="title">Job Title</option>
              <option value="department">Department</option>
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
            <input type="number" className="form-control" id="inputSearchLimit" name="limit" value={this.state.limit} onChange={this.handleChange} />
            <input type="number" className="form-control" id="inputSearchPage" name="page" value={this.state.page} onChange={this.handleChange} />
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
        </form>

        {this.state.returnedEmployees ? <table align="center" className="table mt-5 border" >
          <thead className="table-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">First Name</th>
              <th scope="col">Last Name</th>
              <th scope="col">Middle Initial</th>
              <th scope="col">Employee ID</th>
              <th scope="col">Job Title</th>
              <th scope="col">Department Name</th>
            </tr>
          </thead>
          {/* Add Employees in tbody through HTML injection in main.js */}
          <tbody>
            {this.state.returnedEmployees && this.state.returnedEmployees.map((employeeObj, index) => (
              <tr key={employeeObj.employee_id}>
                <th scope="col">{index}</th>
                <th scope="col">{employeeObj.first_name}</th>
                <th scope="col">{employeeObj.last_name}</th>
                <th scope="col">{employeeObj.m_initial}</th>
                <th scope="col">{employeeObj.employee_id}</th>
                <th scope="col">{employeeObj.job_title}</th>
                <th scope="col">{employeeObj.department_name}</th>
              </tr>
            ))}
          </tbody>
        </table> :
        <div></div>}
      </div>
    );
  }
}

export default SearchForm
