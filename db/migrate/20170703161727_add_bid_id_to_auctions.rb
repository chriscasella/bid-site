class AddBidIdToAuctions < ActiveRecord::Migration[5.1]
  def change
    add_column :auctions, :bid_id, :integer
  end
end
