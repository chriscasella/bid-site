require 'rails_helper'

feature "users can create a new auction" do
  let!(:user) do
    User.create(
    company_name: "Company A",
    contact_first_name: "Chris",
    contact_last_name: "Casella",
    company_website: "www.testsite.com",
    email: "chris@test.com",
    password: "password"
    )
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
end
