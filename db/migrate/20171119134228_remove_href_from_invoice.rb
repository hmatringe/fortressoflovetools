class RemoveHrefFromInvoice < ActiveRecord::Migration[5.0]
  def change
  	remove_column :invoices, :document_file_name
  	remove_column :invoices, :document_content_type
  	remove_column :invoices, :document_file_size
  	remove_column :invoices, :document_updated_at
  end
end
