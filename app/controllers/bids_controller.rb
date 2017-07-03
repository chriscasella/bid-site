class BidsController < ApplicationController

  def new
    @auction = Auction.find(params[:id])
    @bid = Bid.new
  end

  def create
    @auction = Auction.find(params[:id])
    @bid = Bid.new
  end

end
