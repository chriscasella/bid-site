require "rails_helper"


RSpec.describe Api::V1::AuctionsController, type: :controller do
  let(:user) do
    FactoryGirl.create(:user)
  end
  describe "GET #index" do
      it "should return the list of auctions" do
        auction = Auction.create(name: "Test", location: "123 Street Street", auction_start_date: "2017-07-07", auction_close_date: "2017-07-07", user: user)
        get :index

        expect(json["auctions"][0]["name"]).to eq "Test"
        expect(json["auctions"][0]["location"]).to eq "123 Street Street"
        expect(json["auctions"][0]["auction_close_date"]).to eq "2017-07-07"
        expect(json["auctions"][0]["auction_start_date"]).to eq "2017-07-07"
        expect(json["auctions"][0]["description"]).to eq ""
        expect(json["auctions"][0]["id"]).to eq auction.id
      end
    end
end
