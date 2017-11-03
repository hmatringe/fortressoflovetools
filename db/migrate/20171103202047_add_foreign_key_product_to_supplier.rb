class AddForeignKeyProductToSupplier < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :supplier_id, :integer
  	add_foreign_key :products, :suppliers
  end
end
