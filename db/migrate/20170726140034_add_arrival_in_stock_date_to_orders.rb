class AddArrivalInStockDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :arrival_in_stock_date, :date
  end
end
