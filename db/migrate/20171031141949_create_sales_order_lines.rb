class CreateSalesOrderLines < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_order_lines do |t|
      t.datetime :date
      t.integer :qtty
      t.string :SKU
      t.string :woocommerce_order_id

      t.timestamps
    end
  end
end
