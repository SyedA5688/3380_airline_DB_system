import React, { Component } from 'react';
import { Outlet } from "react-router-dom";
import './sidePanels.css'


class EmployeeSidePanel extends Component {
  render() {
    return (
      <div class="container-fluid" >
        <div class="row">
          <div class="col-3" id="sidebar-wrapper" >
            <nav class="sidebar-nav" >
              <ul class="sidebar-ul" >
                <li class="mt-5 my-4" ><a href="/employeespage/insert" >First Option</a></li>
                <li class="my-4" ><a href="/employeespage" >Second Option</a></li>
                <li class="my-4"><a href="/employeespage" >Third Option</a></li>
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


export default EmployeeSidePanel