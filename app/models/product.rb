class Product < ApplicationRecord

	validates_presence_of  :name,:description,:price,:stock_quantity,:category_id
	 has_many :product_taxes
   has_many :taxes, through: :product_taxes
   belongs_to :category
   has_many :reviews

end
