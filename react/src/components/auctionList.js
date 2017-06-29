import React, {Component} from 'react';
import Auction from './Auction';


class AuctionList extends Component {
  constructor(props){
    super(props)
    this.state = {
      auctions: [],
      currentPage: 1,
      auctionsPerPage: 15,
      search: ''
    }
    this.getData = this.getData.bind(this);
    this.previousPage = this.previousPage.bind(this);
   this.nextPage = this.nextPage.bind(this);
   this.updateSearch = this.updateSearch.bind(this);
  }

  previousPage () {
    let newPage = this.state.currentPage - 1;
   this.setState({ currentPage: newPage })
  }

  nextPage(event) {
  let newPage = this.state.currentPage + 1;
  this.setState({ currentPage: newPage })
}

  getData() {
  fetch('http://localhost:3000/api/v1/auctions.json')
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

  updateSearch(event) {
   this.setState({ search: event.target.value.substr(0,20) })
 }

  render () {
    let indexOfLastAuction = this.state.auctions * this.state.auctionsPerPage;
    let indexOfFirstAuction = indexOfLastAuction - this.state.auctionsPerPage;
    let currentAuctions = this.state.auctions;
    let finalAuctions = currentAuctions.map((auction, index) => {
    return (
      <Auction
        key={index}
        id={auction.id}
        name={auction.name}
      />
    )
  });

    return (
      <div>
        {finalAuctions}
      </div>
    )
  }
}

export default AuctionList;
