import React, { Component } from 'react';
import { Outlet } from "react-router-dom";
import './sidePanels.css'


class JobsSidePanel extends Component {
  render() {
    return (
      <div className="container-fluid" >
        <div className="row">
          <div className="col-3" id="sidebar-wrapper" >
            <nav className="sidebar-nav" align="center" >
              <ul className="sidebar-ul" >
                <li className="sidebar-li"><a href="/jobs/search" >Search All Jobs</a></li>
                <li className="sidebar-li"><a href="/jobs/create" >Create New Job</a></li>
                <li className="sidebar-li"><a href="/jobs/update" >Update Job Details</a></li>
                <li className="sidebar-li"><a href="/jobs/delete" >Delete a Job</a></li>
                <li className="sidebar-li"><a href="/jobs/searchLocations" >View All Job Locations</a></li>
                <li className="sidebar-li"><a href="/jobs/createLocation" >Create a Job Location</a></li>
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