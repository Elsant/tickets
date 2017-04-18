import React from 'react'
import ReactDOM from 'react-dom'
import TicketsHead from './TicketsHead'
import Ticket from './Ticket'

class TicketsList extends React.Component {

  render() {
    return (
      <div>
        <h3> Support requests</h3>
        <table className="table table-striped table-hover ">
          <TicketsHead />
          <tbody>
            <Ticket />
          </tbody>
        </table> 
      </div>
    );
  } 

}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <TicketsList />,
    document.getElementById('tickets')
  )
})