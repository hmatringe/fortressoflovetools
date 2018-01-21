class CreateCouponLines < ActiveRecord::Migration[5.0]
  def change
    create_table :coupon_lines do |t|
      t.references :coupon, foreign_key: true
      t.integer :woo_id
      t.string :woo_code
      t.decimal :discount, precision: 11, scale: 4
      t.decimal :discount_tax, precision: 11, scale: 4
      t.references :sales_order_line, foreign_key: true

      t.timestamps
    end
  end
end
