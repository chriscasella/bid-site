require 'rails_helper'

feature "User views bids" do
  let(:auctioneer) do
    FactoryGirl.create(:user)
  end
  let(:bidder) do
    FactoryGirl.create(:user1)
  end
  let(:auction) do
    FactoryGirl.create(:auction, user: auctioneer)
  end
  let(:bid) do
    Bid.create(
    user: auctioneer,
    auction: auction,
    bid_quote: 30000
    )
  end

  scenario 'Auction owner views bids' do
    sign_in_as(bidder)
    visit auction_path(auction)
    click_link "Submit New Bid"
    fill_in "Enter Your Quote Price", :with => 30000
    click_button "Submit Bid"
    click_link "Sign Out"
    sign_in_as(auctioneer)
    visit auction_path(auction)
    click_link "View Bids"

    expect(page).to have_content("$30,000")
  end
end
