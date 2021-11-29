import React, { Component } from 'react';
import { Outlet } from "react-router-dom";
import './sidePanels.css'


class BenefitsSidePanel extends Component {
  render() {
    return (
      <div className="container-fluid" >
        <div className="row">
          <div className="col-3" id="sidebar-wrapper" >
            <nav className="sidebar-nav" align="center" >
              <ul className="sidebar-ul" >
                <li className="sidebar-li"><a href="/benefits/search" >Search All Benefit Packages</a></li>
                <li className="sidebar-li"><a href="/benefits/create" >Create New Benefits Package</a></li>
                <li className="sidebar-li"><a href="/benefits/update" >Update Benefits Package Details</a></li>
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


export default BenefitsSidePanel