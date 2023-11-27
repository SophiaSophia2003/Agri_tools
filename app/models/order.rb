class Order < ApplicationRecord

	validates_presence_of   :customer_id,:order_date,:status,:total_amount
	belongs_to :customer
	has_many :order_items
	has_many :payments

end

