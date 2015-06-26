class AddDefaultToProductState < ActiveRecord::Migration
  def change
  	change_column_default :products, :state, :active
  end
end
