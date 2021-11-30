import React, { Component } from 'react';
import { Outlet } from "react-router-dom";
import './sidePanels.css'


class PayrollSidePanel extends Component {
  render() {
    return (
      <div className="container-fluid" >
        <div className="row">
          <div className="col-3" id="sidebar-wrapper" >
            <nav className="sidebar-nav" align="center" >
              <ul className="sidebar-ul" >
                <li className="sidebar-li"><a href="/payroll/search" >Search All Payroll Entries</a></li>
                <li className="sidebar-li"><a href="/payroll/create" >Create a Payroll Entry</a></li>
                <li className="sidebar-li"><a href="/payroll/createAll" >Calculate Payroll For All Employees</a></li>
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


export default PayrollSidePanel