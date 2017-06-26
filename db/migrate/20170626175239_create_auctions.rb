class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :project_length
      t.integer :workforce_size
      t.date :auction_start_date, null: false
      t.date :auction_close_date, null: false
    end
  end
end
