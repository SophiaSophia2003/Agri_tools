class AddProvinceIdInOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :province_id, :bigint
  end

end
