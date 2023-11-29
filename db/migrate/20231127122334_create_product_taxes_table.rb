class CreateProductTaxesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :product_taxes do |t|
      t.bigint :product_id
      t.bigint :tax_id

      t.timestamps
    end
  end

end
