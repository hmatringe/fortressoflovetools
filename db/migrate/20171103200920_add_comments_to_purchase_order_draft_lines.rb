class AddCommentsToPurchaseOrderDraftLines < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_order_draft_lines, :comments, :text
  end
end
