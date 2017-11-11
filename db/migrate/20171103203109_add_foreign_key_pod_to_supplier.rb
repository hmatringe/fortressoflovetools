class AddForeignKeyPodToSupplier < ActiveRecord::Migration[5.0]
  def change
  	add_column :purchase_order_drafts, :supplier_id, :integer
  	add_foreign_key :purchase_order_drafts, :suppliers
  end
end
