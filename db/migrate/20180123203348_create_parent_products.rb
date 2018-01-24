class CreateParentProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :parent_products do |t|
      t.string :sku
      t.decimal :usual_production_price, precision: 11, scale: 4
      t.string :usual_production_currency, default: "EUR"

      t.timestamps
    end
  end
end
