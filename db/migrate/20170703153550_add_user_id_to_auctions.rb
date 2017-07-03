class AddUserIdToAuctions < ActiveRecord::Migration[5.1]
  def change
    add_reference :auctions, :user, index: true
  end
end
