class AddWinningBidToBids < ActiveRecord::Migration[5.1]
  def change
    add_column :bids, :winning_bid, :boolean, default: false
  end
end
