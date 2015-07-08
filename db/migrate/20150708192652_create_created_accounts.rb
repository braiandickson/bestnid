class CreateCreatedAccounts < ActiveRecord::Migration
  def change
    create_table :created_accounts do |t|
      t.string :name
      t.string :email
      t.date :registration_date

      t.timestamps null: false
    end
  end
end
