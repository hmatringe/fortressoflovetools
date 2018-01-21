class HealToHeel < ActiveRecord::Migration[5.0]
  def change
  	rename_column :products, :heal_thickness, :heel_thickness
  	rename_column :products, :heal_height, :heel_height
  end
end
