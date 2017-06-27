import React, {Component} from 'react';


class AuctionList extends Compnent {
  constructor(props){
    super(props)
    this.state = {
      auctions: []
    }
    this.getData = this.getData.bind(this);
  }

  getData() {
  fetch('/api/v1/auctions.json')
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} ($response.statusText)`,
          error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({ auctions: body["auctions"] })
    })
    .catch(error => console.error(`Error in fetch ${error.message}`));
  }

  componentDidMount(){
    this.getData();
  }

  render () {

    let currentAuctions = this.state.auctions;
    let finalAuctions = currentAuctions.map((auction, index) => {
    return (
      <Auction
        key={index}
        id={auction.id}
        name={auction.name}
        url={auction.website}
        photo={auction.photo}
        location={auction.location}
      />
    )
  });

    return (

    )
  }
}

export default AuctionList;
