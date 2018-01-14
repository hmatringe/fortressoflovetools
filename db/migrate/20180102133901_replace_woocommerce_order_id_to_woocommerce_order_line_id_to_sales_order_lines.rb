class ReplaceWoocommerceOrderIdToWoocommerceOrderLineIdToSalesOrderLines < ActiveRecord::Migration[5.0]
  def change
  	remove_column :sales_order_lines, :woocommerce_order_id
  	add_column :sales_order_lines, :woocommerce_order_line_id, :string
  end
end
