class CreateInventoryPrimaryLines < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_primary_lines do |t|
      t.references :product, foreign_key: true
      t.references :inventory, foreign_key: true

      t.timestamps
    end
  end
end
