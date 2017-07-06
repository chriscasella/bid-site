class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :auctions
  has_many :bids

  validates :contact_first_name, presence: true
  validates :contact_last_name, presence: true
  validates :company_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
