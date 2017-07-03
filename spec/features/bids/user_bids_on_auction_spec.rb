require 'rails_helper'

feature "User submits bid on auction" do
  let(:user) do
    FactoryGirl.create(:user)
  end
let(:auction) do
  Auction.create(
  name: "Test Auction",
  location: "Philadelphia, PA",
  auction_start_date: Time.now,
  auction_close_date: Time.now + 7.day,
  description: "Great auction!"
  )
end
  scenario "Bidder bids on auction" do
    sign_in_as(user)
    visit auction_path(auction)
    click_link "Submit Bid"
    fill_in "Quote Price"
    click_button "Submit Bid"

    expect(page).to have_content("Bid Submitted")
  end
end
