class Province < ApplicationRecord

   validates_presence_of :name, :gst_rate
   has_one :customer


  def self.list_provinces
    self.pluck(:name, :id)
  end


end
