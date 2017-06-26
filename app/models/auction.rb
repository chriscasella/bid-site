class Auction < ApplicationRecord
  has_many :bidders

  validates :name, presence: true
  validates :location, presence: true
  validates :auction_start_date, presence: true
  validates :auction_close_date, presence: true

end
