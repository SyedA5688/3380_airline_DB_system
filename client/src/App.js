import React, { Component } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Navbar from './Navbar';
import EmployeeSidePanel from './pages/EmployeeSidePanel'
import SearchForm from './pages/employees/SearchForm';
import InsertForm from './pages/employees/InsertForm';
import UpdateForm from './pages/employees/UpdateForm';
import DeleteForm from './pages/employees/DeleteForm';
import JobPage from './pages/JobPage';
import './App.css'
// import EmployeeDBTable from './pages/employees/EmployeeDBTable';


class App extends Component {
  render() {
    return (
      <div className="App" >
        <BrowserRouter >
          <div className="entire-page-container" >
            <Routes>
              <Route exact path="/" element={<Navbar />} >
                <Route exact path="employees" element={<EmployeeSidePanel />} >
                  <Route exact path="search" element={<SearchForm />} />
                  <Route exact path="insert" element={<InsertForm />} />
                  <Route exact path="update" element={<UpdateForm />} />
                  <Route exact path="delete" element={<DeleteForm />} />
                </Route>
                <Route exact path="jobs" element={<JobPage />} />
              </Route>
              
            </Routes>
          </div>
        </BrowserRouter>
      </div>
    );
  }
}

export default App;
