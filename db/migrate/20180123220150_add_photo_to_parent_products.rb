class AddPhotoToParentProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :parent_products, :photo, :string
  end
end
