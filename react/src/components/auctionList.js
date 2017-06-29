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
  fetch('http://localhost:3000/api/v1/auctions.json',{method: 'get'})
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
        start={auction.auction_start_date}
        close={auction.auction_close_date}
      />
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



        <div className="text-center">
          <button className={previousClass} onClick={this.previousPage}>
            {previous}
          </button>
          <button className={nextClass} onClick={this.nextPage}>
            {next}
          </button>
        </div>
      </div>
    )
  }
}

export default AuctionList;
