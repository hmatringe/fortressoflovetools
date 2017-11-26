class SimplifyOrdersCurrencyAndReference < ActiveRecord::Migration[5.0]
  def change
  	rename_column :orders, :purchase_or_production_invoice_currency, :invoice_currency
  	rename_column :orders, :purchase_or_production_invoice_reference, :invoice_reference
  end
end
