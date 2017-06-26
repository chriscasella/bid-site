require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    first_name 'chris'
    last_name 'casella'
    password 'password'
    password_confirmation 'password'
  end
end
