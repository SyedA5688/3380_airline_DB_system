import React, { Component } from 'react';
import { Outlet } from "react-router-dom";
import './sidePanels.css'


class DepartmentsSidePanel extends Component {
  render() {
    return (
      <div class="container-fluid" >
        <div class="row">
          <div class="col-3" id="sidebar-wrapper" >
            <nav class="sidebar-nav" >
              <ul class="sidebar-ul" >
                <li class="mt-5 my-4" ><a href="/department" >Search Departments</a></li>
                <li class="my-4" ><a href="/department" >Create New Department</a></li>
                <li class="my-4"><a href="/department" >Update Department Details</a></li>
                <li class="my-4"><a href="/department" >Jobs Within Department</a></li>
                <li class="my-4"><a href="/department" >Employees Within Department</a></li>
              </ul>
            </nav>
          </div>
          <div class="col-9" >
            <Outlet />
          </div>
        </div>
      </div>
    )
  }
}


export default DepartmentsSidePanel