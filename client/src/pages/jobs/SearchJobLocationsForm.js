import React, { Component } from 'react';
import './jobForms.css'


class SearchJobLocationsForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
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
    try {
      const response = await fetch('/job/location');
      const body = await response.json();
      // console.log("Body rows:", body.rows);

      this.assertValidGETResponse(body);
      this.setState({
        returnedJobLocations: body.rows
      });
    }
    catch (e) {
      console.log("Error occurred while sending GET request to /job/location endpoint,", e);
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
      returnedJobLocations: null
    });

    const form = document.querySelector('#searchFormHTML');
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
                Something went wrong while processing your database request, please try again later. <br />

              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>View All Job Locations</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="searchFormHTML" onSubmit={this.handleSubmit} noValidate>
          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>

        {this.state.returnedJobLocations ? <table align="center" className="table mt-5 border" >
          <thead className="table-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">Location ID</th>
              <th scope="col">Address ID</th>
              <th scope="col">Location Name</th>
              <th scope="col">Airport ID</th>
              <th scope="col">Flight ID</th>
            </tr>
          </thead>
          
          <tbody>
            {this.state.returnedJobLocations && this.state.returnedJobLocations.map((jobLocationObj, index) => (
              <tr key={jobLocationObj.location_id}>
                <th scope="col">{index + 1}</th>
                <th scope="col">{jobLocationObj.location_id}</th>
                <th scope="col">{jobLocationObj.address_id}</th>
                <th scope="col">{jobLocationObj.location_name}</th>
                <th scope="col">{jobLocationObj.airport_id}</th>
                <th scope="col">{jobLocationObj.flight_id}</th>
              </tr>
            ))}
          </tbody>
        </table> :
        <div></div>}
      </div>
    );
  }
}

export default SearchJobLocationsForm
