class AddUserRefToInquiries < ActiveRecord::Migration
  def change
    add_reference :inquiries, :user, index: true
    add_foreign_key :inquiries, :users
  end
end
