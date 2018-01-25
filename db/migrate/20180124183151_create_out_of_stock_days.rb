class CreateOutOfStockDays < ActiveRecord::Migration[5.0]
  def change
    create_table :out_of_stock_days do |t|
      t.references :out_of_stock_range, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
