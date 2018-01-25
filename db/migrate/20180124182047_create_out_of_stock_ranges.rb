class CreateOutOfStockRanges < ActiveRecord::Migration[5.0]
  def change
    create_table :out_of_stock_ranges do |t|
      t.references :product, foreign_key: true
      t.string :date_range

      t.timestamps
    end
  end
end
