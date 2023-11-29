class Administrator < ApplicationRecord

	validates_presence_of   :email, :first_name, :last_name
	has_many :products
	has_many :categories
end
