class AddProvinceIdInCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :province_id, :integer

  end
end
