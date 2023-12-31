class Administrator < ApplicationRecord
	  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	validates_presence_of   :email, :first_name, :last_name
	has_many :products
	has_many :categories
end
