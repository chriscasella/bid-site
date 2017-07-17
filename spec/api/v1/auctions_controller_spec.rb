require "rails_helper"


RSpec.describe Api::V1::AuctionsController, type: :controller do
  let(:user) do
    FactoryGirl.create(:user)
  end
  let(:auction) do
    Auction.create(name: "Test", location: "123 Street Street", auction_start_date: Time.now + 7.day, auction_close_date: Time.now + 8.day, user: user)
  end
  describe "GET #index" do
      it "should return the list of auctions" do
        get :index, format: :json
        expect(response).to be_success
      end
    end
end
