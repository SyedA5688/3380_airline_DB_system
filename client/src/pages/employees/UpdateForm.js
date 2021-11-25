import React, { Component } from 'react';
import './employeeForms.css'


class UpdateForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      updateID: ''
    };
    
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange = async (event) => {
    this.setState({
      [event.target.name]: event.target.value
    });
  };

  handleSubmit = async (event) => {
    event.preventDefault();
    console.log("ToDo: implement handle submit");
  };
  
  render() {
    return (
      <div className="container mt-5 px-5">
        <h3>Hello World - Update Form</h3>
      </div>
    );
  }
}

export default UpdateForm
