class AddCurrencyToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :purchase_or_production_invoice_currency, :string
    add_column :orders, :purchase_or_production_invoice_reference, :string
  end
end
