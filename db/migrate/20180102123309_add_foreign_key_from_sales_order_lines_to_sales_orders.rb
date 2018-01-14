class AddForeignKeyFromSalesOrderLinesToSalesOrders < ActiveRecord::Migration[5.0]
  def change
  	add_column :sales_order_lines, :sales_order_id, :integer
  	add_foreign_key :sales_order_lines, :sales_orders
  end
end
