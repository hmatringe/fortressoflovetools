# == Schema Information
#
# Table name: sales_order_lines
#
#  id                        :integer          not null, primary key
#  date                      :datetime
#  qtty                      :integer
#  SKU                       :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  sales_order_id            :integer
#  product_id                :integer
#  woocommerce_order_line_id :string
#  subtotal                  :decimal(11, 4)
#  subtotal_tax              :decimal(11, 4)
#  total                     :decimal(11, 4)
#  total_tax                 :decimal(11, 4)
#  price                     :decimal(11, 4)
#

class SalesOrderLine < ApplicationRecord
  has_many :coupon_lines, dependent: :destroy
  belongs_to :sales_order
  belongs_to :product

  validates :date, presence: true
  validates :qtty, presence: true
  # validates :SKU, presence: true #as SOL now directly points to a Product instance
  validates :woocommerce_order_line_id, presence: true
  validates :subtotal, presence: true
  validates :subtotal_tax, presence: true
  validates :total, presence: true
  validates :total_tax, presence: true
  validates :price, presence: true



  def sol_coupons
    # if coupon_lines.size == 0
      coupon_lines.each_with_object([]) do |cl, a|
        a << cl.coupon.code
      end
    # else
    #   :no_coupon
    # end
  end

	# def self.import(file)
 #    CSV.foreach(file.path, headers: true) do |row|
 #      attributes = {
 #      	SKU: row["SKU"],
 #      	date: row["Order Date"],
 #      	qtty: row["qtty"]
 #      }
 #      SalesOrderLine.create(attributes)
 #    end
 #  end
end
