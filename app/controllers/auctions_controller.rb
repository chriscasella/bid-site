class AuctionsController < ApplicationController

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user
  end

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
  end

  private

  def auction_params
    params.require(:auction).permit(:name, :location, :description, :workforce_size, :project_length)
  end

end
