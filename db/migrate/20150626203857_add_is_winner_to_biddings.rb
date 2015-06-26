class AddIsWinnerToBiddings < ActiveRecord::Migration
  def change
    add_column :biddings, :is_winner, :boolean, :default => false
  end
end
