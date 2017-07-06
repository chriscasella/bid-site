feature "User recieves email upon bid submittal" do
  let(:user) do
    FactoryGirl.create(:user)
  end

  let(:user1) do
    FactoryGirl.create(:user1)
  end

  let(:auction) do
    FactoryGirl.create(:auction, user: user1)
  end

scenario "review a product" do

  sign_in_as(user)
  visit auction_path(auction)
  click_link "Submit New Bid"
  fill_in "Enter Your Quote Price", with: 30000
  click_button "Submit Bid"

  expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
