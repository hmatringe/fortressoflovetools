class AddForeignKeyFromSalesOrderLinesToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :sales_order_lines, :product_id, :integer
  	add_foreign_key :sales_order_lines, :products
  end
end
