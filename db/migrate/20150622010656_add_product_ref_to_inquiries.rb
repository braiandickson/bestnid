class AddProductRefToInquiries < ActiveRecord::Migration
  def change
    add_reference :inquiries, :product, index: true
    add_foreign_key :inquiries, :products
  end
end
