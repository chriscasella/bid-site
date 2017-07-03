class BidsController < ApplicationController

  def index
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids
  end

  def new
    binding.pry
    @auction = Auction.find(params[:auction_id])
    @bid = Bid.new
  end

  def create
    @auction = Auction.find(params[:auction_id])
    # @bid.user_id = current_user.id
    # @bid.auction_id = @auction
    @bid = Bid.new(bid_params)
    @bid.auction = @auction
    @bid.user = current_user

    if @bid.save
      flash[:notice] = "Bid Submitted Successfully"
      redirect_to auction_path(@auction)
    else
      flash[:notice] = @bid.errors.full_messages.to_sentence
      redirect_to new_auction_bid_path(@auction)
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:bid_quote)
  end

end
