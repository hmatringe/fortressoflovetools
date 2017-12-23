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
end
