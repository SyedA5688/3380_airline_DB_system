import React from 'react';
import { Outlet } from "react-router-dom";


class Navbar extends React.Component {
  render() {
    return (
      <div className="navbar-page-container" > 
        <nav className="navbar navbar-dark bg-dark navbar-expand-lg">
          <div className="container-fluid">
            <a className="navbar-brand mx-4" href="/">Airline HR Database System</a>
            <button className="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation" >
              <span className="navbar-toggler-icon"></span>
            </button>

            <div className="collapse navbar-collapse" id="navbarNav">
              <ul className="navbar-nav">
                <li className="nav-item">
                  <a className="nav-link" href="/employees/search">Employees</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/jobs/search">Jobs</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/department/search">Departments</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/leave/search">Leave</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/benefits/search">Benefits</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/payroll/search">Payroll</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div className="page-container" >
          <Outlet />
        </div>
      </div>
    )
  }
}

export default Navbar
