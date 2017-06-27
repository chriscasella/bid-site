import React, {Component} from 'react';


class AuctionList extends Compnent {
  constructor(props){
    super(props)
    this.state = {
      auctions: []
    }
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
    return (

    )
  }
}

export default AuctionList;
