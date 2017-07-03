class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction

  validates :bid_quote, presence: true, numericality: true
end
