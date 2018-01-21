class CreateSalesOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_orders do |t|
      t.date :date
      t.string :country
      t.integer :woocommerce_id

      t.timestamps
    end
  end
end
