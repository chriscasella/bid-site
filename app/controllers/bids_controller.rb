class BidsController < ApplicationController

  def index
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.sort { |bid| bid.bid_quote }
    @bids = @auction.bids
    @winner = @bids.where(winning_bid: :true)
    @winner = @winner[0]
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
      UserMailer.new_bid(@auction, @bid).deliver_now
      redirect_to auction_path(@auction)
    else
      flash[:notice] = @bid.errors.full_messages.to_sentence
      redirect_to new_auction_bid_path(@auction)
    end
  end

  def select_winner
    @auction = Auction.find(params[:auction_id])
    @bid = Bid.find(params[:bid_id])
    @bid.update(:winning_bid => true)
    flash[:notice] = "Winning Bid Selected"
    UserMailer.winning_bid_selected(@auction, @bid).deliver_now
    UserMailer.winning_bid_selector(@auction, @bid).deliver_now
    redirect_to auction_bids_path(@auction)
  end

  private

  def bid_params
    params.require(:bid).permit(:bid_quote, :winning_bid)
  end

end
