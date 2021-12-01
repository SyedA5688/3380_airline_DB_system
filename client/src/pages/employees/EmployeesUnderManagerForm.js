import React, { Component } from 'react';
import './employeeForms.css'


class SearchEmployeesUnderManagerForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      managerID: '',
      searchBy: 'all',
      searchID: '',
      searchFirstName: '',
      searchMiddleInitial: '',
      searchLastName: '',
      searchTitle: '',
      searchDepartment: '',
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
        searchID: '',
        searchFirstName: '',
        searchMiddleInitial: '',
        searchLastName: '',
        searchTitle: '',
        searchDepartment: '',
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
      
      case "id":
        query = this.state.searchID;
        break;
      
      case "name": {
        query = "";
        if (this.state.searchFirstName !== '') {
          query += this.state.searchFirstName.trim();
        }
        if (this.state.searchMiddleInitial !== '') {
          query += " " + this.state.searchMiddleInitial.trim();
        }
        if (this.state.searchLastName !== '') {
          query += " " + this.state.searchLastName.trim();
        }
        query = query.trim();
        break;
      }
      
      case "title":
        query = this.state.searchTitle.trim();
        break;
      
      case "department":
        query = this.state.searchDepartment.trim();
        break;
      
      default:
        query = "";
    }
    // console.log("Sending query:", query);
    
    try {
      // let querySearchStr = query === "" ? `searchBy=${this.state.searchBy}` : `q=${query}&searchBy=${this.state.searchBy}`
      const response = await fetch(`/manager/${this.state.managerID}?q=${query}&searchBy=${this.state.searchBy}&page=${this.state.page}&sort=${this.state.sort}&order=${this.state.order}&limit=${this.state.limit}`);
      const body = await response.json();
      // console.log("Response Body:", body);

      this.assertValidGETResponse(body);
      this.setState({
        returnedEmployees: body.rows,
        queries: body.queries
      });
    }
    catch (e) {
      console.log("Error occurred while sending GET request to /manager/:id endpoint,", e);
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
      managerID: '',
      searchBy: 'all',
      searchID: '',
      searchFirstName: '',
      searchMiddleInitial: '',
      searchLastName: '',
      searchTitle: '',
      searchDepartment: '',
      returnedEmployees: null,
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
    else if (searchBy === "name") {
      return (
        <div className="input-group" >
          <div className="input-group-prepend">
            <span className="input-group-text" id="">First, MI, Last</span>
          </div>
          <input type="text" pattern="[A-Za-z]*" className="form-control" id="inputSearchFirstName" placeholder="John (Optional)" name="searchFirstName" value={this.state.searchFirstName} onChange={this.handleChange} />

          <input type="text" pattern="[A-Z]{1}" className="form-control" id="inputSearchMiddleInitial" placeholder="M (Optional)" name="searchMiddleInitial" value={this.state.searchMiddleInitial} onChange={this.handleChange} />

          <input type="text" pattern="[A-Za-z]*" className="form-control" id="inputSearchLastName" placeholder="Doe (Optional)" name="searchLastName"  value={this.state.searchLastName} onChange={this.handleChange} />
          <div className="invalid-feedback">Please provide valid possible names (a-z, A-Z).</div>
          <div className="valid-feedback">Valid name.</div>
        </div>
      )
    }
    else if (searchBy === "id") {
      return <div className="form-group">
        <input type="number" min="1" step="1" pattern="[0-9]+"  className="form-control" id="inputSearchID" placeholder="(e.g. 1000003)" name="searchID" value={this.state.searchID} onChange={this.handleChange} required />
        <div className="invalid-feedback">Please provide a valid ID number.</div>
        <div className="valid-feedback">Valid ID number.</div>
      </div>
    }
    else if (searchBy === "title") {
      return <div className="form-group">
        <input type="text" pattern="[A-Za-z0-9-_ ]+"  className="form-control" id="inputSearchTitle" placeholder="(e.g. Pilot)" name="searchTitle" value={this.state.searchTitle} onChange={this.handleChange} required />
        <div className="invalid-feedback">Please provide a valid job title.</div>
        <div className="valid-feedback">Valid job title.</div>
      </div>
    }
    else if (searchBy === "department") {
      return <div className="form-group">
        <input type="text" pattern="[A-Za-z0-9-_ ]+" className="form-control" id="inputSearchDepartment" placeholder="(e.g. Flight Crew)" name="searchDepartment" value={this.state.searchDepartment} onChange={this.handleChange} required />
        <div className="invalid-feedback">Please provide a valid department name.</div>
        <div className="valid-feedback">Valid department name.</div>
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
                Something went wrong while processing your database request, please check your inputs, especially any ID numbers, these must be existing IDs in the database. Contact airline database assistance for further help. <br />

              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Search Database for Managers(s)</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="searchFormHTML" onSubmit={this.handleSubmit} noValidate>

        <h5>Manager to Query Under:</h5>
          <div className="form-group">
            <label className="sr-only" htmlFor="inputManagerID">Manager ID</label>
            <input type="number" step="1" min="0" pattern="[0-9]+" className="form-control" id="inputManagerID" placeholder="(e.g. 1000000)" value={this.state.managerID} name="managerID" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide valid existing Manager ID.</div>
          </div>

        <h5 className="mt-3" >Sort Employees Options:</h5>
          <div className="form-group mb-2" >
            <label className="sr-only" htmlFor="inputSearchBy">Search by:</label>
            <select name="searchBy" className="form-select " id="inputSearchBy" defaultValue="all" onChange={this.handleChange}>
              <option value="all">Get All Employees</option>
              <option value="name">Name</option>
              <option value="id">Manager ID</option>
              <option value="title">Job Title</option>
              <option value="department">Department</option>
            </select>
          </div>
          {searchByInputElement}
            
          <div className="form-group mt-2" >
            <label className="sr-only" htmlFor="inputSortBy">Sort by:</label>
            <select name="sort" className="form-select" id="inputSortBy" defaultValue="id" onChange={this.handleChange}>
              <option value="id">Manager ID</option>
              <option value="fname">First Name</option>
              <option value="lname">Last Name</option>
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

        {this.state.returnedEmployees ? 
        <div>
          <h3>Employees Under Manager:</h3>
          <table align="center" className="table mt-5 border" >
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

export default SearchEmployeesUnderManagerForm
