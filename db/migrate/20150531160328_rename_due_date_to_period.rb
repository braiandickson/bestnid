class RenameDueDateToPeriod < ActiveRecord::Migration

  def self.up
  	add_column :products, :period, :integer
  	remove_column :products, :due_date
  end

  def self.down
  	add_column :products, :due_date, :date
  	remove_column :products, :period
  end

end
