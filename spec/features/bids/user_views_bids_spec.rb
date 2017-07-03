require 'rails_helper'

feature "User views bids" do
  let(:user) do
    FactoryGirl.create(:user)
  end
  let(:user1) do
    FactoryGirl.create(:user1)
  end
  let(:auction) do
    FactoryGirl.create(:auction, user_id: user.id, bid_id: bid.id)
  end
  let(:bid) do
    Bid.create(
    user_id: user1.id,
    auction_id: auction.id,
    bid_quote: 30000
    )
  end

  xscenario 'Auction owner views bids' do
    sign_in_as(user)
    visit auction_path(auction)
    click_link "View Bids"

    expect(page).to have_content(30000)
  end
end
