class Api::V1::VenuesController < ApplicationController
  def index
    render json: { venues: Auction.all }
  end
end
