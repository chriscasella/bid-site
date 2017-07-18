require "rails_helper"

feature "User recieves mail upon winning auction" do
  let(:auctioneer) do
    FactoryGirl.create(:user)
  end

  let(:bidder) do
    FactoryGirl.create(:user1)
  end

  let(:auction) do
    FactoryGirl.create(:auction, user: auctioneer)
  end

scenario "winning bidder recieves email" do

  sign_in_as(bidder)
  visit auction_path(auction)
  click_link "Submit New Bid"
  fill_in "Enter Your Quote Price", :with =>  30000
  click_button "Submit Bid"
  click_link "Sign Out"
  sign_in_as(auctioneer)
  visit auction_bids_path(auction)
  click_button "Select Winner"

  expect(ActionMailer::Base.deliveries.count).to eq(3)
  end
end
