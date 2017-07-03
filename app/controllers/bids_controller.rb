class BidsController < ApplicationController

  def index
    @bid = Bid.find(params[:id])
    @auction = Auction.find(params[:auction_id])
    # if @auction.user == current_user
    #   else
    #     flash[:notice] = "You do not have permission to view bids"
    #     redirect_to  auction_path(@auction)
    # end
  end

  def new
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
