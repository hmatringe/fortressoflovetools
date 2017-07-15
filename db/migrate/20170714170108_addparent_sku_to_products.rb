class AddparentSkuToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :parentSKU, :string
  end
end
