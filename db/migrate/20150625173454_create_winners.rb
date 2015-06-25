class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.references :product, index: true
      t.references :bidding, index: true

      t.timestamps null: false
    end
    add_foreign_key :winners, :products
    add_foreign_key :winners, :biddings
  end
end
