class ChangeQttyAfterOrderDataTypeFromStringToIntegerPurchaseOrderDraftLines < ActiveRecord::Migration[5.0]
  def change
  	remove_column :purchase_order_draft_lines, :qtty_after_order, :sting
  	add_column :purchase_order_draft_lines, :qtty_after_order, :integer
  end
end
