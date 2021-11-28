import React, { Component } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Navbar from './Navbar';

import EmployeeSidePanel from './pages/EmployeeSidePanel';
import SearchAllForm from './pages/employees/SearchAllForm';
import InsertForm from './pages/employees/InsertForm';
import UpdateForm from './pages/employees/UpdateForm';
import GetForm from './pages/employees/GetForm';

import JobsSidePanel from './pages/JobsSidePanel';
import SearchAllJobsForm from './pages/jobs/SearchAllJobsForm';
import CreateJobForm from './pages/jobs/CreateJobForm';
import UpdateJobForm from './pages/jobs/UpdateJobForm';

import LeaveSidePanel from './pages/LeaveSidePanel';
import SearchAllLeaveForm from './pages/leave/SearchAllLeaveForm';

import DepartmentsSidePanel from './pages/DepartmentSidePanel';
import './App.css'


class App extends Component {
  render() {
    return (
      <div className="App" >
        <BrowserRouter >
          <div className="entire-page-container" >
            <Routes>
              <Route exact path="/" element={<Navbar />} >
                <Route exact path="employees" element={<EmployeeSidePanel />} >
                  <Route exact path="search" element={<SearchAllForm />} />
                  <Route exact path="insert" element={<InsertForm />} />
                  <Route exact path="get" element={<GetForm />} />
                  <Route exact path="update" element={<UpdateForm />} />
                </Route>

                <Route exact path="jobs" element={<JobsSidePanel />} >
                  <Route exact path="search" element={<SearchAllJobsForm />} />
                  <Route exact path="create" element={<CreateJobForm />} />
                  <Route exact path="update" element={<UpdateJobForm />} />
                </Route>

                <Route exact path="leave" element={<LeaveSidePanel />} >
                  <Route exact path="search" element={<SearchAllLeaveForm />} />
                </Route>

                <Route exact path="department" element={<DepartmentsSidePanel />} />
              </Route>
              
            </Routes>
          </div>
        </BrowserRouter>
      </div>
    );
  }
}

export default App;
