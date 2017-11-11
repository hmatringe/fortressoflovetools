class PurchaseOrderDraftLine < ApplicationRecord
  belongs_to :purchase_order_draft
  belongs_to :product
  before_save :update_days_of_sales_after_order
  
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



