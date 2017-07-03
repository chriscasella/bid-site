class AuctionsController < ApplicationController

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.auction_start_date = Time.now

    if @auction.save
      flash[:notice] = "Auction Successfully Created"
      redirect_to root_path
    else
      flash[:notice] = @auction.errors.full_messages.to_sentence
      redirect_to new_auction_path
    end
  end

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
  end

  private

  def auction_params
    params.require(:auction).permit(:name, :location, :description, :workforce_size, :project_length, :auction_close_date)
  end

end
