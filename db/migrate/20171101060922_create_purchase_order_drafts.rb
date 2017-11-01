class CreatePurchaseOrderDrafts < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_order_drafts do |t|
      t.string :name
      t.integer :supply_period_days
      t.string :supplier
      t.references :inventory, foreign_key: true

      t.timestamps
    end
  end
end
