class AddArrivalInStockDateToOrderLines < ActiveRecord::Migration[5.0]
  def change
    add_column :order_lines, :arrival_in_stock_date, :date
  end
end
