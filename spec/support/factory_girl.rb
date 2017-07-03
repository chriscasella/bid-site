require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    company_name 'Best Biz'
    contact_first_name 'chris'
    contact_last_name 'casella'
    company_website 'www.fakebusiness.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :user1, class: User do
    sequence(:email) {|n| "user#{n}@eeexample.com" }
    company_name 'Ebb and Flow'
    contact_first_name 'Alan'
    contact_last_name 'Watts'
    company_website 'www.FreeYourself.com'
    password 'password'
    password_confirmation 'password'
  end
end
