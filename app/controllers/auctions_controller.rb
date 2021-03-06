class AuctionsController < ApplicationController

  def new
    @auction = Auction.new
    @auction.user_id = current_user
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.auction_start_date = Time.now
    @auction.user = current_user

    if @auction.save
      flash[:notice] = "Auction Successfully Created"
      UserMailer.new_auction(@auction).deliver_now
      redirect_to root_path
    else
      flash[:notice] = @auction.errors.full_messages.to_sentence
      redirect_to new_auction_path
    end
  end

  def index
    if user_session.nil?
      @auctions = Auction.all
      @message = "All Auctions"
    elsif params[:user_id] == current_user
      @auctions = current_user.auctions
      @message = "Auctions for #{current_user.name}"
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @bid = @auction.bids
  end

  private

  def auction_params
    params.require(:auction).permit(:name, :location, :description, :workforce_size, :project_length, :auction_close_date, :user)
  end

end
