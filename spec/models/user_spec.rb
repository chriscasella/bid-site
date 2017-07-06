require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:contact_first_name).when('Watts') }
  it { should_not have_valid(:contact_first_name).when(nil,'') }
  it { should have_valid(:contact_last_name).when('Alan') }
  it { should_not have_valid(:contact_last_name).when(nil,'') }
  it { should have_valid(:company_name).when('Best Biz') }
  it { should_not have_valid(:company_name).when(nil,'') }
  it { should have_valid(:email).when('alan.watts@zen.com') }
  it { should_not have_valid(:email).when('alan.com','@com') }
end
