class BidsController < ApplicationController

  def index
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids
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

  def update
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids
    if @bid.update(bid_params)
      flash[:notice] = "Winning Bid Selected"
      redirect_to auction_bids_path(@auction, @bid)
      binding.pry
    else
      flash[:notice] = "Error"
    end
  end

  def select_winner
    @auction = Auction.find(params[:auction_id])
    @bid = Bid.find(params[:bid_id])
    @bid.update(:winning_bid => true)
    binding.pry
    flash[:notice] = "Winning Bid Selected"
    redirect_to auction_path(@auction)
  end

  private

  def bid_params
    params.require(:bid).permit(:bid_quote, :winning_bid)
  end

end
