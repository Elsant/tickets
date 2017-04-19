import React from 'react'
import ReactDOM from 'react-dom'
import TicketsHead from './TicketsHead'
import Ticket from './Ticket'
import NewTicket from './NewTicket'

class TicketsList extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      user_role: 'user',
      token: '',
      tickets: [],
    };
  }

  componentDidMount() {
    $.getJSON('/api/v1/tickets', (response) => { 
      this.setState({ 
        user_role: response.user_role,
        token: response.token,
        tickets: response.tickets 
      }) 
    });
  }

  handleNewSubmit(ticket) {
    var newState = this.state.tickets.concat(ticket);
    this.setState({ tickets: newState }) 
  }

  handleCloseSubmit(response) {
    this.setState({ 
      user_role: response.user_role,
      token: response.token,
      tickets: response.tickets 
    }) 
  } 

  render() {
    var tickets = this.state.tickets.map((tkt, index) => { 
      return ( 
        <Ticket key={tkt.id} cnt={index + 1} {... tkt} user_role={this.state.user_role} handleSubmit={this.handleCloseSubmit.bind(this)} />
      ) 
    });

    return (
      <div>
        <h3> Support requests</h3>
        {this.state.user_role == 'user' ? <NewTicket token={this.state.token} handleSubmit={this.handleNewSubmit.bind(this)} /> :  <div> </div>}
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