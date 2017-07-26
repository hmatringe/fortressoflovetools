class AddQttyToInventoryPrimaryLines < ActiveRecord::Migration[5.0]
  def change
    add_column :inventory_primary_lines, :qtty, :string
  end
end
