import React, {Component} from 'react';
import Auction from './Auction';


class AuctionList extends Component {
  constructor(props){
    super(props)
    this.state = {
      auctions: [],
      currentPage: 1,
      auctionsPerPage: 9,
      search: ''
    }
    this.getData = this.getData.bind(this);
    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
    this.updateSearch = this.updateSearch.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  previousPage () {
    let newPage = this.state.currentPage - 1;
   this.setState({ currentPage: newPage })
  }

  nextPage(event) {
  let newPage = this.state.currentPage + 1;
  this.setState({ currentPage: newPage })
}

handleClick(event){
    this.setState({ currentPage: event.target.id });
  };

  getData() {
  fetch('/api/v1/auctions.json',{method: 'get'})
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
   this.setState({ search: event.target.value.substr(0,50) })
 }

  render () {
    let indexOfLastAuction = this.state.currentPage * this.state.auctionsPerPage;
    let indexOfFirstAuction = indexOfLastAuction - this.state.auctionsPerPage;
    let currentAuctions;
    let filtered = this.state.auctions.filter(
       (auction) => {
         return auction.name.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1 ||
         auction.location.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1;
       }
   );

   let previousClass = "hollow button"
    let nextClass = "hollow button"
    let previous = "⇦"
    let next = "⇨"

   if (indexOfFirstAuction < 0 ) {
     currentAuctions = filtered.slice(0, 10);
   } else {
     currentAuctions = filtered.slice(indexOfFirstAuction, indexOfLastAuction)
   }

    let finalAuctions = currentAuctions.map((auction, index) => {
    return (
      <Auction
        key={index}
        id={auction.id + 1}
        name={auction.name}
        location={auction.location}
        start={auction.auction_start_date}
        close={auction.auction_close_date}
      />
    )
  });

  let pageNumbers = [];

    for(let i = 1; i <= Math.ceil(this.state.auctions.length / this.state.auctionsPerPage); i++) {
    pageNumbers.push(i);
  }

  let renderPageNumbers = pageNumbers.map(number => {
    return(
      <li
        className= "current"
        key={number}
        id={number}
        onClick={this.handleClick}
      >
        {number}
      </li>
    )
  });

    return (
      <div>
        <input
       placeholder="Search"
       type="text"
       value={this.state.search}
       onChange={this.updateSearch}
       className="searchBar"
       />
       <div className="row">
           {finalAuctions}
       </div>
       <div className="pagination">
         <ul>
         {renderPageNumbers}
         </ul>
       </div>
      </div>
    )
  }
}

export default AuctionList;
