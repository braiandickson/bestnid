class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.date :due_date
      t.string :state


      t.timestamps null: false
    end
  end
end
