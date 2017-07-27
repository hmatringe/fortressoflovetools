class AddAverageInventoryValuePerUnitToInventoryPrimaryLines < ActiveRecord::Migration[5.0]
  def change
    add_column :inventory_primary_lines, :average_inventory_value_per_unit, :decimal, precision: 11, scale: 4, default: 0
  end
end
