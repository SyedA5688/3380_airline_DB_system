import React, { Component } from 'react';
import { Outlet } from "react-router-dom";
import './sidePanels.css'


class JobsSidePanel extends Component {
  render() {
    return (
      <div className="container-fluid" >
        <div className="row">
          <div className="col-3" id="sidebar-wrapper" >
            <nav className="sidebar-nav" >
              <ul className="sidebar-ul" >
                <li className="mt-5 my-4" ><a href="/jobs" >Search Jobs</a></li>
                <li className="my-4" ><a href="/jobs" >Create New Job</a></li>
                <li className="my-4"><a href="/jobs" >Update Job Details</a></li>
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


export default JobsSidePanel