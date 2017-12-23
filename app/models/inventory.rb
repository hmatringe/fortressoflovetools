# == Schema Information
#
# Table name: inventories
#
#  id         :integer          not null, primary key
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Inventory < ApplicationRecord
  has_many :inventory_primary_lines, dependent: :destroy
  has_many :purchase_order_drafts, dependent: :destroy

  validates :date, presence: true

  def select_label
    "Inventory made - #{self.date}"
  end
end
