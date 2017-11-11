class AddDaysOutOfStockToPurchaseOrderDraftLines < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_order_draft_lines, :days_out_of_stock, :integer
  end
end
