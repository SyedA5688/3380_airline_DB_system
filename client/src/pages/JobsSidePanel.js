import React, { Component } from 'react';
import { Outlet } from "react-router-dom";
import './sidePanels.css'


class JobsSidePanel extends Component {
  render() {
    return (
      <div class="container-fluid" >
        <div class="row">
          <div class="col-3" id="sidebar-wrapper" >
            <nav class="sidebar-nav" >
              <ul class="sidebar-ul" >
                <li class="mt-5 my-4" ><a href="/jobs" >Search Jobs</a></li>
                <li class="my-4" ><a href="/jobs" >Create New Job</a></li>
                <li class="my-4"><a href="/jobs" >Update Job Details</a></li>
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


export default JobsSidePanel