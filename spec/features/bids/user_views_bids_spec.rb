require 'rails_helper'

feature "User views bids" do
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

  scenario 'Auction owner views bids' do
    sign_in_as(user1)
    visit auction_path(auction)
    click_link "Submit New Bid"
    fill_in "Quote Price", with: 30000
    click_button "Submit Bid"

    expect(page).to have_content('Bid Submitted Successfully')
    expect(page).to have_content('Sign Out')

  end
end
