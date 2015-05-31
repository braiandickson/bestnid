class RemovePeriodForDueDate < ActiveRecord::Migration
  def self.up
  	remove_column :products, :period
  	add_column :products, :due_date, :date
  end

  def self.down
  	remove_column :products, :due_date
  	add_column :products, :period, :integer
  end
end
