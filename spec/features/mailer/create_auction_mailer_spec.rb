feature "User recieves mail upon auction creation" do
  let(:user) do
    FactoryGirl.create(:user)
  end

scenario "review a product" do

  sign_in_as(user)
  visit new_auction_path
  fill_in "Name of Auction", with: "Lead Drinking Water Survey"
  fill_in "Location", with: "Camden, NJ"
  fill_in "Description", with: "Test Description"
  click_button "Create Auction"

  expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
