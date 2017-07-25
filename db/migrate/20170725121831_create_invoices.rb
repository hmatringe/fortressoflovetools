class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.decimal :amount_in_invoice_currency, precision: 11, scale: 4
      t.string :invoice_currency
      t.decimal :amount_in_accounting_currency, precision: 11, scale: 4
      t.string :reference
      t.string :url
      t.date :issue_date
      t.date :due_date
      t.date :payment_date

      t.timestamps
    end
  end
end
