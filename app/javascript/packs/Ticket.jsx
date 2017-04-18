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
        <td>{ticket.closed_status}</td>
        <td>{ticket.closed_day}</td>
        <td>{ticket.user_role == 'user' ? 'u' : 'a'}</td>
      </tr>
    );
  } 

}

Ticket.defaultProps = {
  cnt: 1,
  title: 'No Data',
  body: '',
  closed_status: '',
  closed_day: '',
  user_role: 'user'
};

Ticket.propTypes = {
  cnt: React.PropTypes.number,
  title: React.PropTypes.string,
  body: React.PropTypes.string,
  closed_status: React.PropTypes.string,
  closed_day: React.PropTypes.string,
  user_role: React.PropTypes.string
};


export default Ticket;
