class AddDescriptionToAuctions < ActiveRecord::Migration[5.1]
  def change
    add_column :auctions, :description, :string, null: false, default: ''
  end
end
