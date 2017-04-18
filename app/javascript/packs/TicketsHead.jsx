import React from 'react'
import ReactDOM from 'react-dom'

class TicketsHead extends React.Component {
  render() {
    var headers = this.props;
    return (
      <thead>
        <tr>
          <th>{headers.headCnt}</th>
          <th>{headers.headTitle}</th>
          <th>{headers.headBody}</th>
          <th>{headers.headStatus}</th>
          <th>{headers.headClosedDay}</th>
          <th></th>
        </tr>
      </thead>
    );
  } 
}

TicketsHead.defaultProps = {
  headCnt: '#',
  headTitle: 'Title',
  headBody: 'Ticket',
  headStatus: 'Status',
  headClosedDay: 'Date'
};

TicketsHead.propTypes = {
  headCnt: React.PropTypes.string,
  headTitle: React.PropTypes.string,
  headBody: React.PropTypes.string,
  headStatus: React.PropTypes.string,
  headClosedDay: React.PropTypes.string
};

export default TicketsHead;
