class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.date :date

      t.timestamps
    end
  end
end
