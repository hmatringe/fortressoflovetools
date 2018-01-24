# == Schema Information
#
# Table name: purchase_order_drafts
#
#  id                 :integer          not null, primary key
#  name               :string
#  supply_period_days :integer
#  inventory_id       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  supplier_id        :integer
#

class PurchaseOrderDraft < ApplicationRecord
  belongs_to :inventory
  has_many :purchase_order_draft_lines, dependent: :destroy
  belongs_to :supplier

  validates :name, presence: true
  validates :supply_period_days, presence: true

  def total_quantity
  	# inventory_primary_lines.each_with_object([]) do |ipl, a|
  	# 	a << ipl.qtty.to_i
  	# end.reduce(:+)
    purchase_order_draft_lines.pluck(:order_qtty).map{|q| q.to_i}.reduce(:+)
  end

  def total_value
    purchase_order_draft_lines.map do |podl|
    	podl.product.parent_product.usual_production_price * podl.order_qtty.to_i
    end.reduce(:+)
  end
end
