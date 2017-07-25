class AddAdditionalCostPerUnitToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :additional_costs_per_unit, :decimal, precision: 11, scale: 4
    add_column :orders, :additional_costs, :decimal, precision: 11, scale: 4
  end
end
