class OrderItem < ApplicationRecord

	validates_presence_of  :order_id,:product_id,:quantity,:subtotal,:unit_price
	belongs_to :order
	belongs_to :product

end

