class CartItem < ApplicationRecord

	validates_presence_of  :product_id,:quantity
	belongs_to :product
	belongs_to :cart

end

