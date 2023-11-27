class Review < ApplicationRecord

	validates_presence_of   :customer_id,:product_id
	belongs_to :customer
	belongs_to :product

end
