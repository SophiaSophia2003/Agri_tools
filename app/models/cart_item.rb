class CartItem < ApplicationRecord
	# attr_accessor :payment_method
	validates_presence_of  :product_id,:quantity
	belongs_to :product
	# belongs_to :order
	belongs_to :cart

end

