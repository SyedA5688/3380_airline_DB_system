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
                <li className="sidebar-li"><a href="/department/search" >Search Departments</a></li>
                <li className="sidebar-li"><a href="/department/create" >Create New Department</a></li>
                <li className="sidebar-li"><a href="/department/update" >Update Department Details</a></li>
                <li className="sidebar-li"><a href="/department/delete" >Delete a Department</a></li>
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