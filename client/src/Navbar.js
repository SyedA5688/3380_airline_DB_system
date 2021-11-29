import React from 'react';
import { Outlet } from "react-router-dom";


export default function Navbar() {
  return (
    <div className="navbar-page-container" > 
      <nav className="navbar navbar-dark bg-dark navbar-expand-lg">
        <a className="navbar-brand mx-4" href="/">Airline HR Database System</a>
        <button className="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
              <a className="nav-link" href="/department">Departments</a>
            </li>
            <li className="nav-item">
              <a className="nav-link" href="/leave/search">Leave</a>
            </li>
            <li className="nav-item">
              <a className="nav-link" href="/">Payroll</a>
            </li>
            <li className="nav-item">
              <a className="nav-link" href="/">Benefits</a>
            </li>
          </ul>
        </div>
      </nav>
      <div className="page-container" >
        <Outlet />
      </div>
    </div>
  )
}