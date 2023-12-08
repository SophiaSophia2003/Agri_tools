class Province < ApplicationRecord

   # validates :province_name, :gst_rate
   has_one :customer


  def self.list_provinces
    self.pluck(:name, :id)
  end


end
