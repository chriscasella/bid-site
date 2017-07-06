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

  let(:bid) do
    Bid.create(
    bid_quote: 4300,
    user: bidder,
    auction: auction
    )
  end

xscenario "winning bidder recieves email" do

  sign_in_as(auctioneer)
  visit auction_bids_path(auction)
  click_button "Select Winner"

  expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
