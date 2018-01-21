class AddCountryToSalesOrderLines < ActiveRecord::Migration[5.0]
  def change
  	add_column :sales_order_lines, :country, :string
  end
end
