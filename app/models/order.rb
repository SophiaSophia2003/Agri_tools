class Order < ApplicationRecord

	validates_presence_of   :customer_id, :order_total

end
