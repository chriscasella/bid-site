require 'rails_helper'

feature "User submits bid on auction" do
  let(:user) do
    FactoryGirl.create(:user)
  end
  let(:user1) do
    FactoryGirl.create(:user1)
  end
let(:auction) do
  Auction.create(
  name: "Test Auction",
  location: "Philadelphia, PA",
  auction_start_date: Time.now,
  auction_close_date: Time.now + 7.day,
  description: "Great auction!",
  user_id: user.id
  )
end
  scenario "Bidder bids on auction" do
    sign_in_as(user1)
    visit auction_path(auction)
    click_link "Submit New Bid"
    fill_in "Quote Price", with: 123
    click_button "Submit Bid"

    expect(page).to have_content("Bid Submitted")
  end

  scenario "Bidder does submits incomplete bid" do
    sign_in_as(user1)
    visit auction_path(auction)
    click_link "Submit New Bid"
    click_button "Submit Bid"

    expect(page).to have_content("Bid quote can't be blank and Bid quote is not a number")
  end
end
