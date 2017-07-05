import React, {Component} from 'react';

class Auction extends Component {
  constructor(props){
    super(props)
  }
  render () {
    return (
      <div className="callout">
        <div className="row" id="auction-index">
          <a href={`/auctions/${this.props.id - 1}`}>
            <h3>{this.props.name}</h3>
          </a>
          <div>
            <h4> Location: {this.props.location}</h4>
          </div>
          <div className="row">
            <div className="small-6 columns">
              <h5>Start Date: {this.props.start}</h5>
            </div>
            <div className="small-6 columns">
              <h5>
                Close Date: {this.props.close}
              </h5>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default Auction;
