class Category < ApplicationRecord

	validates_presence_of   :name
	  has_many :categorizations
  has_many :products, through: :categorizations

end
