require 'rails_helper'

feature "User signs up" do
  scenario 'a new user signs up' do
    visit root_path

    click_link 'Sign Up'

    fill_in 'Company Name', with: "Greatest Company On Earth!"
    fill_in 'Primary Contact First Name', with: "Chris"
    fill_in 'Primary Contact Last Name', with: "Casella"
    fill_in "Company Website", with: "https://fakebusiness.com"
    fill_in 'Email', with: "chris@email.com"
    fill_in 'Password', with: "testtest"
    fill_in 'Password Confirmation', with: "testtest"

    click_button 'Sign Up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end
end
