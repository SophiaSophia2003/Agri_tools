class OrderItem < ApplicationRecord

	validates_presence_of   :order_id, :product_id

end
