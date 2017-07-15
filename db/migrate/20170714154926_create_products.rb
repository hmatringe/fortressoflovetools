class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :SKU
      t.string :name
      t.string :size
      t.string :color
      t.string :structure
      t.string :category

      t.timestamps
    end
  end
end
