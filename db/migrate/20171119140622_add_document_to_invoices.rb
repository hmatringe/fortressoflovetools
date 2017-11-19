class AddDocumentToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :document, :string
  end
end
