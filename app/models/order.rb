class Order < ApplicationRecord
  attr_accessor :payment_method
	validates_presence_of   :customer_id,:status,:total_amount
	belongs_to :customer
  has_many :cart_items, dependent: :destroy
  as_enum :status, ['NEW','PAID','FULFILLED','SHIPPED'], map: :string, source: :status

  accepts_nested_attributes_for :cart_items
  validates :total_amount, numericality: { message: "must be a amount number" }
  # before_validation :set_order_status_and_amount, on: :create

  def set_order_status_and_amount
  	self.status = "FULFILLED"
  end
end

