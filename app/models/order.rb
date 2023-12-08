class Order < ApplicationRecord
  attr_accessor :payment_method
	validates_presence_of   :customer_id,:status,:total_amount
	belongs_to :customer
	# has_many :order_items
	# has_many :payments
  has_many :cart_items, dependent: :destroy

  accepts_nested_attributes_for :cart_items
  before_validation :set_order_status_and_amount, on: :create

  def set_order_status_and_amount
  	self.status = "FULFILLED"
  end
end

