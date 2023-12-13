class Cart < ApplicationRecord

	validates_presence_of   :customer_id,:product_id
	belongs_to :customer
	belongs_to :product
	has_many :cart_items

	def add_product(product)
    current_item = cart_items.find_by(product: product)

    if current_item
      current_item.quantity += 1
    else
      # current_item = cart_items.build(product: product,quantity: 1)
      current_item = CartItem.create!(product_id: product.id,quantity: 1,cart_id: self.id)
    end

    current_item
  end

end
      