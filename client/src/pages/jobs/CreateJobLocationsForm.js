import React, { Component } from 'react';
import './jobForms.css'


class CreateJobLocationForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      address_id: '',
      location_name: '',
      airport_id: '',
      flight_id: ''
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
    const form = document.querySelector('#insertFormHTML');

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
        address_id: this.state.address_id, 
        location_name: this.state.location_name,
        airport_id: this.state.airport_id,
        flight_id: this.state.flight_id
      };
      console.log("Sending insert new job location POST request with:", body);
  
      const response = await fetch("/job/location ", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      });
  
      const responseBody = await response.json();
      console.log(responseBody);
      this.assertValidDBResponse(responseBody);
  
      this.setState({
        insertedJobLocation: responseBody.rows
      });
    }
    catch (err) {
      console.log("Error occurred while sending Insert Job Location POST request to server:", err.message);
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
      address_id: '',
      location_name: '',
      airport_id: '',
      flight_id: '',
      insertedJobLocation: null
    });

    // Remove was-validated class from form to reset its appearance
    const form = document.querySelector('#insertFormHTML');
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
                Something went wrong while processing your database request. Please try again and check your form inputs, especially inputted IDs! <br />
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-primary" onClick={this.closeModal} >Close</button>
              </div>
            </div>
          </div>
        </div>

        <h3>Create New Job Location</h3>

        <form className="border border-secondary mt-3 px-5 py-4 rounded needs-validation" id="insertFormHTML" onSubmit={this.handleSubmit} noValidate>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputOfficeAddressID">Office Address ID</label>
            <input type="number" step="1"  pattern="[0-9]+" className="form-control" id="inputOfficeAddressID" placeholder="0 (Must be an existing ID)" value={this.state.address_id} name="address_id" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid office address ID.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputJobLocationName">Job Location Name</label>
            <input type="text" pattern="[A-Za-z ]+" className="form-control" id="inputJobLocationName" placeholder="(e.g. New York Office)" value={this.state.location_name} name="location_name" onChange={this.handleChange} required />
            <div className="invalid-feedback">Please provide a valid job location name.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputAirportID">Airport ID</label>
            <input type="number" step="1" min="0" pattern="[0-9]*" className="form-control" id="inputAirportID" placeholder="0 (Must be an existing ID)" value={this.state.airport_id} name="airport_id" onChange={this.handleChange}  />
            <div className="invalid-feedback">Please provide a valid airport ID.</div>
          </div>

          <div className="form-group">
            <label className="sr-only" htmlFor="inputFlightID">Flight ID</label>
            <input type="number" step="1" min="0" pattern="[0-9]*" className="form-control" id="inputFlightID" placeholder="0 (Must be an existing ID)" value={this.state.flight_id} name="flight_id" onChange={this.handleChange} />
            <div className="invalid-feedback">Please provide valid flight ID.</div>
          </div>

          <button type="submit" className="btn btn-outline-secondary mt-3">Submit</button>
          <button type="button" className="btn btn-outline-secondary mt-3 mx-3" onClick={this.handleClear} >Clear</button>
        </form>

        {this.state.insertedJobLocation ? 
        <div>
          <h3 className="mt-5 ">Inserted Job Location</h3>
          <table align="center" className="table border mt-3 mb-5" >
            <thead className="table-dark">
              <tr>
                <th scope="col">Location ID</th>
                <th scope="col">Address ID</th>
                <th scope="col">Location Name</th>
                <th scope="col">Airport ID</th>
                <th scope="col">Flight ID</th>
              </tr>
            </thead>
            
            <tbody>
              {this.state.insertedJobLocation && this.state.insertedJobLocation.map(jobLocationObj => (
                <tr key={jobLocationObj.location_id}>
                  <th scope="col">{jobLocationObj.location_id}</th>
                  <th scope="col">{jobLocationObj.address_id}</th>
                  <th scope="col">{jobLocationObj.location_name}</th>
                  <th scope="col">{jobLocationObj.airport_id}</th>
                  <th scope="col">{jobLocationObj.flight_id}</th>
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

export default CreateJobLocationForm
