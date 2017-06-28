import React, {Component} from 'react';

class Auction extends Component {
  constructor(props){
    super(props)
  }
  render () {
    return (
      <div className="callout">
          <h3> {this.props.name} </h3>
      </div>
    )
  }
}

export default Auction;
