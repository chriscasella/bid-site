class Auction < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :location, presence: true
  validates :auction_start_date, presence: true

end
