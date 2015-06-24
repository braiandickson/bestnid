class CreateBiddings < ActiveRecord::Migration
  def change
    create_table :biddings do |t|
      t.text :reason
      t.decimal :amount
      t.references :product, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :biddings, :products
    add_foreign_key :biddings, :users
  end
end
