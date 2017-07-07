import React, {Component} from 'react';

class Auction extends Component {
  constructor(props){
    super(props)
  }
  render () {
    return (
      <div className="callout co-index">
        <div className="row" id="auction-index">
          <div className="small-5 columns auction-name">
          <a href={`/auctions/${this.props.id - 1}`}>
            <h4>{this.props.name}</h4>
          </a>
        </div>
          <div className="small-4 columns auction-location">
            <h4>{this.props.location}</h4>
          </div>
          <div className="small-3 columns close-date">
              <h5>{this.props.close} </h5>
          </div>
        </div>
      </div>
    )
  }
}

export default Auction;
