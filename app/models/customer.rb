class Customer < ApplicationRecord

	validates_presence_of  :username,:first_name,:last_name,:email,:password,:phone_number,:address

end
