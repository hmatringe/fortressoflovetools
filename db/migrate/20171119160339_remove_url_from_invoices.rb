class RemoveUrlFromInvoices < ActiveRecord::Migration[5.0]
  def change
  	remove_column :invoices, :url
  end
end
