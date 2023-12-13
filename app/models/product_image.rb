class ProductImage < ApplicationRecord
  belongs_to :product
  # mount_uploader :image, ImageUploader # Assuming you are using CarrierWave for image uploads
end
