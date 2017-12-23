# == Schema Information
#
# Table name: purchase_order_draft_lines
#
#  id                         :integer          not null, primary key
#  purchase_order_draft_id    :integer
#  SKU                        :string
#  qtty_in_stock              :integer
#  order_qtty                 :integer
#  sold_in_supply_period_days :integer
#  days_of_sales_after_order  :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  days_out_of_stock          :integer
#  sales_speed                :float
#  qtty_after_order           :integer
#  status                     :integer          default("processing")
#  comments                   :text
#  product_id                 :integer
#

class PurchaseOrderDraftLine < ApplicationRecord
  belongs_to :purchase_order_draft
  belongs_to :product
  before_save :update_days_of_sales_after_order

  # not strictly necessary, but safeguard for future view modifications
  # validates :SKU, presence: true
  validates :qtty_in_stock, presence: true
  validates :order_qtty, presence: true
  validates :sold_in_supply_period_days, presence: true
  # validates :days_of_sales_after_order, presence: true
  validates :days_out_of_stock, presence: true
  validates :sales_speed, presence: true
  validates :qtty_after_order, presence: true
  validates :status, presence: true
  
  enum status: [ :processing, :finalized ]

  def update_days_of_sales_after_order
  	self.days_of_sales_after_order = self.qtty_after_order / sales_speed
  end
  
  def sales_speed
  	self.sales_speed = self.sold_in_supply_period_days / useful_supply_period.to_f
  end
  
  def full_supply_period
  	@full_supply_period ||= PurchaseOrderDraft.find(self.purchase_order_draft_id).supply_period_days
  end
  
  def useful_supply_period  	
  	full_supply_period - self.days_out_of_stock
  end
  
  def recommended_qtty
  	recommended_qtty = full_supply_period * sales_speed - self.qtty_in_stock
  end
end



