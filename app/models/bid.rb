class Bid < ApplicationRecord
  has_many :users
  belongs_to :auction
end
