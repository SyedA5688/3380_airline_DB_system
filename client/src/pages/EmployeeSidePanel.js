import React, { Component } from 'react';
import { Outlet } from "react-router-dom";
import './sidePanels.css'


class EmployeeSidePanel extends Component {
  render() {
    return (
      <div className="container-fluid" >
        <div className="row">
          <div className="col-3" id="sidebar-wrapper" >
            <nav className="sidebar-nav" align="center" >
              <ul className="sidebar-ul" >
                <li className="sidebar-li" ><a href="/employees/search" >Search All Employees</a></li>
                <li className="sidebar-li" ><a href="/employees/insert" >Insert New Employee</a></li>
                <li className="sidebar-li" ><a href="/employees/get" >Get Employee Details</a></li>
                <li className="sidebar-li" ><a href="/employees/update" >Update Employee Information</a></li>
                <li className="sidebar-li" ><a href="/employees/delete" >Delete an Employee</a></li>
                <li className="sidebar-li" ><a href="/employees/managers" >Search All Managers</a></li>
                <li className="sidebar-li" ><a href="/employees/employeesUnderManagers" >Search Manager Supervisees</a></li>
              </ul>
            </nav>
          </div>
          <div className="col-9" >
            <Outlet />
          </div>
        </div>
      </div>
    )
  }
}


export default EmployeeSidePanel