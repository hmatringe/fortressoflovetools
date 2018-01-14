# == Schema Information
#
# Table name: fetched_sales_orders
#
#  id                         :integer          not null, primary key
#  woocommerce_sales_order_id :string
#  body                       :json
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class FetchedSalesOrder < ApplicationRecord
end
