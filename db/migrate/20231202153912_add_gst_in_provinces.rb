class AddGstInProvinces < ActiveRecord::Migration[7.0]
  def change
    add_column :provinces, :gst_rate, :decimal, default: 0.0
    add_column :provinces, :pst_rate, :decimal, default: 0.0
    add_column :provinces, :hst_rate, :decimal, default: 0.0
  end
end
