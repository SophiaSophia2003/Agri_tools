class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :recoverable, and :rememberable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Customize the association according to your existing Customer model
  belongs_to :customer, optional: true
end