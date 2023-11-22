class Order < ApplicationRecord

	validates_presence_of   :customer_id,:order_date,:status,:total_amount

end

