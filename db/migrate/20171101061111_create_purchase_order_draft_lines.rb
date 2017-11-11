class CreatePurchaseOrderDraftLines < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_order_draft_lines do |t|
      t.references :purchase_order_draft, foreign_key: true
      t.string :SKU
      t.integer :qtty_in_stock
      t.integer :order_qtty
      t.string :qtty_after_order
      t.integer :sold_in_supply_period_days
      t.integer :days_of_sales_after_order

      t.timestamps
    end
  end
end
