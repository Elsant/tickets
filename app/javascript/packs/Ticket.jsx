import React from 'react'
import ReactDOM from 'react-dom'

class Ticket extends React.Component {

  handleClick() {
    var id = this.props.id;
    var url = '/api/v1/tickets/'+id+'/close' ;
    var csrfToken = $('meta[name=csrf-token]').attr('content');
    
    $.ajax({
      url: url, 
      type: 'PATCH', 
      data: { utf8: "✓", authenticity_token: csrfToken},
      success: (response) => {
        this.props.handleSubmit(response);
      } 
    });
  }

  render() {
    var ticket = this.props;
    var showButton = ( (ticket.user_role != 'user') && (ticket.closed_status == 'open')) ? true : false;
    
    return (
      <tr>
        <td>{ticket.cnt}</td>
        <td>{ticket.title}</td>
        <td>{ticket.body}</td>
        <td>{ticket.closed_status}</td>
        <td>{ticket.closed_day}</td>
        <td>{ showButton ? <button className='btn btn-success btn-sm' onClick={this.handleClick.bind(this)}>Close</button> : '' }</td>
      </tr>
    );
  } 
}

Ticket.defaultProps = {
  cnt: 1,
  id: 0,
  title: 'No Data',
  body: '',
  closed_status: '',
  closed_day: '',
  user_role: 'user'
};

Ticket.propTypes = {
  cnt: React.PropTypes.number,
  id: React.PropTypes.number,
  title: React.PropTypes.string,
  body: React.PropTypes.string,
  closed_status: React.PropTypes.string,
  closed_day: React.PropTypes.string,
  user_role: React.PropTypes.string
};

export default Ticket;
