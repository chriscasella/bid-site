class Api::V1::AuctionsController < ApplicationController
  def index
    render json: { auctions: Auction.all }
  end
end
