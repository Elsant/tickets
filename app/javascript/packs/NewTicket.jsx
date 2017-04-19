import React from 'react'
import ReactDOM from 'react-dom'

class NewTicket extends React.Component {

  handleNewClick() {
    var title = this.refs.title.value;
    var body  = this.refs.body.value;
    var token = this.refs.token.value;
    
    $.ajax({
      url: '/api/v1/tickets', 
      type: 'POST', 
      data: { utf8: "✓", authenticity_token: token, ticket: { title: title, body: body } },
      success: (ticket) => {
        this.props.handleSubmit(ticket); 
      } 
    }); 
  }

  render() { 
    return ( 
      <div>
        <div className="form-group">
          <input type='hidden' ref='token' value={this.props.token} />
          <label className="col-md-1 control-label">Title</label>
          <div className="col-md-3">
            <input ref='title' className="form-control" placeholder='Title of the ticket' />
          </div>
          <label className="col-md-1 control-label">Text</label>
          <div className="col-md-5">
            <input ref='body'  className="form-control" placeholder='Text of the ticket' /> 
          </div>
          <div className="col-md-2">
            <button className='btn btn-info btn-block' onClick={this.handleNewClick.bind(this)}>New Ticket</button> 
          </div>
        </div>
        <br/>
        <hr/>
      </div>
    ) 
  } 

}

NewTicket.defaultProps = {
  token: ''
};

NewTicket.propTypes = {
  token: React.PropTypes.string
};

export default NewTicket;
