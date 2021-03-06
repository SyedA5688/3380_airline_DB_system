import React, { Component } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Navbar from './Navbar';

import EmployeeSidePanel from './pages/EmployeeSidePanel';
import SearchAllForm from './pages/employees/SearchAllForm';
import InsertForm from './pages/employees/InsertForm';
import UpdateForm from './pages/employees/UpdateForm';
import GetForm from './pages/employees/GetForm';
import SearchManagersForm from './pages/employees/SearchManagersForm';
import SearchEmployeesUnderManagerForm from './pages/employees/EmployeesUnderManagerForm';
import DeleteEmployeeForm from './pages/employees/DeleteEmployeeForm';

import JobsSidePanel from './pages/JobsSidePanel';
import SearchAllJobsForm from './pages/jobs/SearchAllJobsForm';
import CreateJobForm from './pages/jobs/CreateJobForm';
import UpdateJobForm from './pages/jobs/UpdateJobForm';
import DeleteJobForm from './pages/jobs/DeleteJobForm';
import SearchJobLocationsForm from './pages/jobs/SearchJobLocationsForm';
import CreateJobLocationForm from './pages/jobs/CreateJobLocationsForm';

import LeaveSidePanel from './pages/LeaveSidePanel';
import SearchAllLeaveForm from './pages/leave/SearchAllLeaveForm';
import SearchEmployeeLeaveForm from './pages/leave/SearchEmployeeLeaveForm';
import CreateLeaveForm from './pages/leave/CreateLeaveForm';
import UpdateLeaveForm from './pages/leave/UpdateLeaveForm';

import DepartmentsSidePanel from './pages/DepartmentSidePanel';
import CreateDepartmentForm from './pages/departments/CreateDepartmentForm';
import SearchDepartmentsForm from './pages/departments/SearchDepartments';
import UpdateDepartmentForm from './pages/departments/UpdateDepartment';
import DeleteDepartmentForm from './pages/departments/DeleteDepartment';

import BenefitsSidePanel from './pages/BenefitsSidePanel';
import CreateBenefitsForm from './pages/benefits/CreateNewBenefitsForm';
import SearchBenefitsForm from './pages/benefits/SearchBenefitsPackagesForm';
import UpdateBenefitsForm from './pages/benefits/UpdateBenefitsPackage';

import PayrollSidePanel from './pages/PayrollSidePanel';
import SearchPayrollForm from './pages/payroll/SearchAllPayrollForm';
import CreatePayrollEntryForm from './pages/payroll/CreatePayrollEntryForm';
import CreateAllPayrollForm from './pages/payroll/CreateAllPayrollForm';
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
                  <Route exact path="delete" element={<DeleteEmployeeForm />} />
                  <Route exact path="managers" element={<SearchManagersForm />} />
                  <Route exact path="employeesUnderManagers" element={<SearchEmployeesUnderManagerForm />} />
                </Route>

                <Route exact path="jobs" element={<JobsSidePanel />} >
                  <Route exact path="search" element={<SearchAllJobsForm />} />
                  <Route exact path="create" element={<CreateJobForm />} />
                  <Route exact path="update" element={<UpdateJobForm />} />
                  <Route exact path="delete" element={<DeleteJobForm />} />
                  <Route exact path="searchLocations" element={<SearchJobLocationsForm />} />
                  <Route exact path="createLocation" element={<CreateJobLocationForm />} />
                </Route>

                <Route exact path="leave" element={<LeaveSidePanel />} >
                  <Route exact path="search" element={<SearchAllLeaveForm />} />
                  <Route exact path="getEmployee" element={<SearchEmployeeLeaveForm />} />
                  <Route exact path="create" element={<CreateLeaveForm />} />
                  <Route exact path="update" element={<UpdateLeaveForm />} />
                </Route>

                <Route exact path="department" element={<DepartmentsSidePanel />} >
                  <Route exact path="create" element={<CreateDepartmentForm />} />
                  <Route exact path="search" element={<SearchDepartmentsForm />} />
                  <Route exact path="update" element={<UpdateDepartmentForm />} />
                  <Route exact path="delete" element={<DeleteDepartmentForm />} />
                </Route>

                <Route exact path="benefits" element={<BenefitsSidePanel />} >
                  <Route exact path="create" element={<CreateBenefitsForm />} />
                  <Route exact path="search" element={<SearchBenefitsForm />} />
                  <Route exact path="update" element={<UpdateBenefitsForm />} />
                </Route>

                <Route exact path="payroll" element={<PayrollSidePanel />} >
                  <Route exact path="create" element={<CreatePayrollEntryForm />} />
                  <Route exact path="search" element={<SearchPayrollForm />} />
                  <Route exact path="createAll" element={<CreateAllPayrollForm />} />
                </Route>
              </Route>
              
            </Routes>
          </div>
        </BrowserRouter>
      </div>
    );
  }
}

export default App;
