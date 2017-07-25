class AddForeignKeyInvoicesOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :order_id, :integer
    add_foreign_key :invoices, :orders
  end
end
