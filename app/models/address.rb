class Address < ApplicationRecord

	validates_presence_of   :customer_id,:address_type,:street_address,:city,:state,:zip_code,:country
	belongs_to :customer

end

