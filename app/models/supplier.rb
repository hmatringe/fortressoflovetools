class Supplier < ApplicationRecord
	has_many :products
	has_many :purchase_order_drafts
end
