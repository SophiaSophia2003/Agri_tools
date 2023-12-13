class Product < ApplicationRecord

   validates :name, :price, :description, presence: true
   validates :price, numericality: { greater_than_or_equal_to: 0 }
	 has_many :product_taxes
   has_many :taxes, through: :product_taxes
   belongs_to :category
   has_many :reviews
   has_many :order_items
   has_many :cart_items
   has_many :product_images, dependent: :destroy
   as_enum :product_type, ['SALE','NEW','RECENTLY'], map: :string, source: :product_type
   # mount_uploader :thumbnail, ThumbnailUploader


end
