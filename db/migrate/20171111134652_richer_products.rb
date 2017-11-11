class RicherProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :heal_thickness, :integer
  	add_column :products, :platform, :boolean
  	add_column :products, :material, :string
  	add_column :products, :heal_height, :string
  	add_column :products, :closing_type, :string
  	add_column :products, :EAN, :bigint
  	add_column :products, :woocommerce_product_id, :string
  end
end
