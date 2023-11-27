class CreateTaxesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :taxes do |t|
      t.string :name
      t.decimal :rate, precision: 5, scale: 2

      t.timestamps
    end
  end
end
