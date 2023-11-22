class Review < ApplicationRecord

	validates_presence_of   :customer_id,:product_id

end
