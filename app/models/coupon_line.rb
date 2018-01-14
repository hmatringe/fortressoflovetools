# == Schema Information
#
# Table name: coupon_lines
#
#  id                  :integer          not null, primary key
#  coupon_id           :integer
#  woo_id              :integer
#  woo_code            :string
#  discount            :decimal(11, 4)
#  discount_tax        :decimal(11, 4)
#  sales_order_line_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class CouponLine < ApplicationRecord
  belongs_to :coupon
  belongs_to :sales_order_line
end
