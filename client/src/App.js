import React, { Component } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Navbar from './Navbar';
import EmployeeSidePanel from './pages/EmployeeSidePanel'
import InsertForm from './pages/employees/InsertForm';
import SearchForm from './pages/employees/SearchForm';
import JobPage from './pages/JobPage';
// import EmployeeDBTable from './pages/employees/EmployeeDBTable';


class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <div>
          <Routes>
            <Route exact path="/" element={<Navbar />} >
              <Route exact path="employeespage" element={<EmployeeSidePanel />} >
                <Route exact path="insert" element={<InsertForm />} />
              </Route>
              <Route exact path="jobspage" element={<JobPage />} />
            </Route>
            <Route exact path="/search" element={<SearchForm />} />
            
          </Routes>
        </div>
      </BrowserRouter>
    );
  }
}

export default App;
