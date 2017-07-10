class Api::V1::AuctionsController < ApplicationController
  def index
    @auctions = Auction.where('auction_close_date > ?', DateTime.now)
    render json: { auctions: @auctions }
  end
end
