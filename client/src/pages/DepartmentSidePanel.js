import React, { Component } from 'react';
import { Outlet } from "react-router-dom";
import './sidePanels.css'


class DepartmentsSidePanel extends Component {
  render() {
    return (
      <div className="container-fluid" >
        <div className="row">
          <div className="col-3" id="sidebar-wrapper" >
            <nav className="sidebar-nav" align="center" >
              <ul className="sidebar-ul" >
                <li className="sidebar-li"><a href="/department" >Search Departments</a></li>
                <li className="sidebar-li"><a href="/department" >Create New Department</a></li>
                <li className="sidebar-li"><a href="/department" >Update Department Details</a></li>
                <li className="sidebar-li"><a href="/department" >Jobs Within Department</a></li>
                <li className="sidebar-li"><a href="/department" >Employees Within Department</a></li>
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


export default DepartmentsSidePanel