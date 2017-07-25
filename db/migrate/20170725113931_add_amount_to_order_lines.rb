class AddAmountToOrderLines < ActiveRecord::Migration[5.0]
  def change
    add_column :order_lines, :production_cost_per_unit_invoice_currency, :decimal, precision: 11, scale: 4
    add_column :order_lines, :production_cost_per_unit_accounting_currency, :decimal, precision: 11, scale: 4
  end
end
