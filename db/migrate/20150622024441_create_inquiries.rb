class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :question
      t.string :answer
      t.references :product, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
    add_foreign_key :inquiries, :products
    add_foreign_key :inquiries, :users
  end
end
