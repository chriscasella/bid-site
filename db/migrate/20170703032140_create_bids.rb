class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.integer "user_id", null: false
      t.integer "auction_id", null: false
      t.integer "bid_quote", null: false
    end
  end
end
