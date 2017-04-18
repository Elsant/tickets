import React from 'react'
import ReactDOM from 'react-dom'

class Ticket extends React.Component {

  render() {
    var ticket = this.props;
    return (
      <tr>
        <td>{ticket.cnt}</td>
        <td>{ticket.title}</td>
        <td>{ticket.body}</td>
        <td>{ticket.status}</td>
        <td>{ticket.closed_day}</td>
      </tr>
    );
  } 

}

Ticket.defaultProps = {
  cnt: 1,
  title: 'No Data',
  ticket: '',
  status: '',
  closed_day: ''
};

Ticket.propTypes = {
  cnt: React.PropTypes.number,
  title: React.PropTypes.string,
  ticket: React.PropTypes.string,
  status: React.PropTypes.string,
  closed_day: React.PropTypes.string
};


export default Ticket;
