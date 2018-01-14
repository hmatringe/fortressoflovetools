class CompletingSalesOrderLines < ActiveRecord::Migration[5.0]
  def change
  	add_column :sales_order_lines, :subtotal, :decimal, precision: 11, scale: 4
		add_column :sales_order_lines, :subtotal_tax, :decimal, precision: 11, scale: 4
		add_column :sales_order_lines, :total, :decimal, precision: 11, scale: 4
		add_column :sales_order_lines, :total_tax, :decimal, precision: 11, scale: 4
		add_column :sales_order_lines, :price, :decimal, precision: 11, scale: 4
  end
end
