# == Schema Information
#
# Table name: sales_orders
#
#  id             :integer          not null, primary key
#  date           :date
#  country        :string
#  woocommerce_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class SalesOrder < ApplicationRecord
	has_many :sales_order_lines, dependent: :destroy
end
