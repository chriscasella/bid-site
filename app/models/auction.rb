class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids

  validates :name, presence: true
  validates :location, presence: true
  validates :auction_start_date, presence: true

end
