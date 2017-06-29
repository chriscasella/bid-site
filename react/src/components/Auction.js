import React, {Component} from 'react';

class Auction extends Component {
  constructor(props){
    super(props)
  }
  render () {
    return (
      <div className="small-10 columns">
          <h1> {this.props.name} </h1>
      </div>
    )
  }
}

export default Auction;
