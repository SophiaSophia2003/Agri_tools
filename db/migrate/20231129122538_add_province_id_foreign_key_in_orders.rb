class AddProvinceIdForeignKeyInOrders < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "orders", "provinces", column: "province_id", name: "orders_province_id_FK", on_update: :cascade
    
  end
end
