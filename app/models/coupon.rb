# == Schema Information
#
# Table name: coupons
#
#  id         :integer          not null, primary key
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Coupon < ApplicationRecord
	has_many :coupon_lines


	def label_code
		code
	end
end
