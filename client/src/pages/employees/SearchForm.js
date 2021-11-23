import React, { Component } from 'react';

class SearchForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      searchInput: '',
      searchBy: 'name'
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
    const response = await fetch(`/search?q=${this.state.searchInput}&i=${this.state.searchBy}`);
    const body = await response.json();
    // Currently just logging the results. Later display as a table or form, etc
    console.log(body.rows);
  };
  
  render() {
    return (
      <div className="" >
        <form onSubmit={this.handleSubmit}>
          <label>
            Search
            <input name="searchInput" type="text" value={this.state.searchInput} onChange={this.handleChange} />
          </label>
          <select name="searchBy" value={this.state.searchBy} onChange={this.handleChange}>
            <option value="name">Name</option>
            <option value="id">ID</option>
          </select>
          <input type="submit" id="submit-button" value="Submit" />
        </form>
      </div>
    );
  }
}

export default SearchForm
