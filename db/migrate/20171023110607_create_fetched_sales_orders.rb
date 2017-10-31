class CreateFetchedSalesOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :fetched_sales_orders do |t|
      t.integer :woocommerce_sales_order_id
      t.json :body

      t.timestamps
    end
  end
end
