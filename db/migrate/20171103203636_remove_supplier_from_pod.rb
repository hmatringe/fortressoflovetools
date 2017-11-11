class RemoveSupplierFromPod < ActiveRecord::Migration[5.0]
  def change
  	remove_column :purchase_order_drafts, :supplier, :string
  end
end
