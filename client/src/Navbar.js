import React from 'react';
import { Outlet } from "react-router-dom";


export default function Navbar() {
  return (
    <div style={{ borderWidth: 1, borderStyle: 'solid', borderColor: 'red', height: '100%' }} > 
      <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
        <a class="navbar-brand mx-4" href="/">Airline HR Database System</a>
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="/employees/search">Employees</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/jobs">Jobs</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/">Departments</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/">Payroll</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/">Salary</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/">Benefits</a>
            </li>
          </ul>
        </div>
      </nav>
      <div  style={{ borderWidth: 1, borderStyle: 'solid', borderColor: 'blue' }} >
        <Outlet />
      </div>
    </div>
  )
}