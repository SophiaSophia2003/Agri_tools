class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	validates_presence_of  :first_name,:last_name,:email,:password,:phone_number
	has_many :addresses
	has_many :orders
	has_many :reviews
	has_one :cart

	def self.create_cart(options)
		return Cart.create(product_id: options[:product_id],customer_id: self.id,quantity: options[:quantity])
	end

end
