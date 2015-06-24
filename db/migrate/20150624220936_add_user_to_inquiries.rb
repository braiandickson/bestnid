class AddUserToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :user, :reference
  end
end
