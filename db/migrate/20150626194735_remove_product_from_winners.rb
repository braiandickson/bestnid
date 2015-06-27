class RemoveProductFromWinners < ActiveRecord::Migration
  def change
    remove_reference :winners, :product, index: true
    remove_foreign_key :winners, :products
  end
end
