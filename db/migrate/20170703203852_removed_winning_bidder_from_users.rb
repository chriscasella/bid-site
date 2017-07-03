class RemovedWinningBidderFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :winning_bidder
  end
end
