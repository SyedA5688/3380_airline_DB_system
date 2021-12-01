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
                <li className="sidebar-li"><a href="/leave/search" >Search All Leave Entries</a></li>
                <li className="sidebar-li"><a href="/leave/getEmployee" >Employee Leave Entries</a></li>
                <li className="sidebar-li"><a href="/leave/create" >Create New Leave</a></li>
                <li className="sidebar-li"><a href="/leave/update" >Update Leave Details</a></li>
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