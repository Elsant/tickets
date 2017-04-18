import React from 'react'
import ReactDOM from 'react-dom'
import TicketsHead from './TicketsHead'
import Ticket from './Ticket'

class TicketsList extends React.Component {
  componentDidMount() {
    $.getJSON('/api/v1/tickets', (response) => { this.setState({ tickets: response }) });
  }

  constructor(props) {
    super(props);
    this.state = {
      tickets: [],
    };
  }

  render() {
    var tickets = this.state.tickets.map((tkt, index) => { 
      return ( 
        <Ticket key={tkt.id} cnt={index + 1} {... tkt}  />
      ) 
    });

    return (
      <div>
        <h3> Support requests</h3>
        <table className="table table-striped table-hover ">
          <TicketsHead />
          <tbody>
             {tickets}
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
});