require 'rails_helper'

feature "users can view a show page" do
  let!(:auction1) do
    Auction.create(
    name: "Auction1 Test",
    location: "Philadelphia, PA",
    description: "This is a test description for the auction",
    workforce_size: 20,
    auction_start_date: Time.now,
    auction_close_date: Time.now
    )
  end
  scenario "User sees an auction1" do
    visit auction_path(auction1)

    expect(page).to have_content auction1.name
    expect(page).to have_content auction1.location
    expect(page).to have_content auction1.description
    expect(page).to have_content auction1.workforce_size
    expect(page).to have_content auction1.auction_start_date
    expect(page).to have_content auction1.auction_close_date
  end

end
