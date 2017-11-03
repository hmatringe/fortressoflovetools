class AddSalesSpeedToPurchaseOrderDraftLines < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_order_draft_lines, :sales_speed, :float
  end
end
