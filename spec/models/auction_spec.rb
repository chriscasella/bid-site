require 'rails_helper'

RSpec.describe Auction, type: :model do
  it { should have_valid(:name).when('Auction name test') }
  it { should_not have_valid(:name).when(nil,'') }

  it { should have_valid(:location).when('Philadelphia, PA') }
end
