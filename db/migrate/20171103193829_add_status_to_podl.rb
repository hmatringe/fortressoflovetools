class AddStatusToPodl < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_order_draft_lines, :status, :integer, default: 0
  end
end
