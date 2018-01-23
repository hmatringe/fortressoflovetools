class AddForeignKeyFromProductsToParentProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :parent_product_id, :integer
  	add_foreign_key :products, :parent_products
  end
end
