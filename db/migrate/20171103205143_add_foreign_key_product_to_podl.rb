class AddForeignKeyProductToPodl < ActiveRecord::Migration[5.0]
  def change
  	add_column :purchase_order_draft_lines, :product_id, :integer
  	add_foreign_key :purchase_order_draft_lines, :products
  end
end
