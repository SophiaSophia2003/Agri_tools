class Cart < ApplicationRecord

	validates_presence_of   ,:customer_id,:product_id,:quantity
	belongs_to :customer
	belongs_to :product

end
      