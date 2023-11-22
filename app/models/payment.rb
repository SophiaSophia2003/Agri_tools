class Payment < ApplicationRecord

	validates_presence_of   :order_id,:payment_date,:payment_method,:amount,:transaction_id

end
