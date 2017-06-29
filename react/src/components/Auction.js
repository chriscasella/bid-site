import React, {Component} from 'react';

class Auction extends Component {
  constructor(props){
    super(props)
  }
  render () {
    return (
      <div className="callout">
        <div className="row">
          <a href={`/auctions/${this.props.id}`}>
            <h3>{this.props.name}</h3>
          </a>
            <div className="small-3 columns">
              <h6>Start Date: {this.props.start}</h6>
            </div>
            <div className="small-9 columns">
              <h6>
                Close Date: {this.props.close}
              </h6>
            </div>
        </div>
      </div>
    )
  }
}

export default Auction;
