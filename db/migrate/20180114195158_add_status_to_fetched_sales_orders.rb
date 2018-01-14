class AddStatusToFetchedSalesOrders < ActiveRecord::Migration[5.0]
  def change
  	add_column :fetched_sales_orders, :status, :integer, default: 0
  end
end
