require 'rails_helper'

feature "users can create a new auction" do
  let(:user) do
    FactoryGirl.create(:user)
  end
  scenario "User creates auction" do
    sign_in_as(user)
    visit root_path
    click_link "Create Auction"
    fill_in "Name of Auction", with: "Lead Drinking Water Survey"
    fill_in "Location", with: "Camden, NJ"
    fill_in "Description", with: "Test Description"
    click_button "Create Auction"

    expect(page).to have_content "Auction Successfully Created"
  end

  scenario "User submits incomplete information for auction" do
    sign_in_as(user)
    visit root_path
    click_link "Create Auction"
    click_button "Create Auction"

    expect(page).to have_content "Name can't be blank and Location can't be blank"
  end
end
