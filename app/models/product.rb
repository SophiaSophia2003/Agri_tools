class Product < ApplicationRecord

	validates_presence_of  :name,:description,:price,:stock_quantity,:category_id

end
