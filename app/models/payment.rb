class Payment < ApplicationRecord

	validates_presence_of   :order_id

end
