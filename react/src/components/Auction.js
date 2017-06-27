import React, {Component} from 'react';

class Auction extends Component {
  constructor(props){
    super(props)
  }
  render () {
    return (
      <div>
      <a href={`/venues/${this.props.id}`}>
        <h1> {this.props.name} </h1>
      </a>
      </div>
    )
  }
}

export default Auction;
