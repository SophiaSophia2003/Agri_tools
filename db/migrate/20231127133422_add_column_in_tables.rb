class AddColumnInTables < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :administrator_id, :integer
    add_column :products, :administrator_id, :integer

    add_foreign_key "product_taxes", "products", column: "product_id", name: "product_tax_product_id_FK", on_update: :cascade        
    add_foreign_key "product_taxes", "taxes", column: "tax_id", name: "product_tax_tax_id_FK", on_update: :cascade
  end
end
