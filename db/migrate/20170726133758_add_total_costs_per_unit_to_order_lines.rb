class AddTotalCostsPerUnitToOrderLines < ActiveRecord::Migration[5.0]
  def change
    add_column :order_lines, :total_costs_per_unit, :decimal, precision: 11, scale: 4, default: 0
  end
end
