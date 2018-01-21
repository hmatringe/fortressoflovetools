class RemoveSkuFromSalesOrderLines < ActiveRecord::Migration[5.0]
  def change
  	remove_column :sales_order_lines, :SKU
  end
end
