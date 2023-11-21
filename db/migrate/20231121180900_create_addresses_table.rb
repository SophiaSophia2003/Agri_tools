class CreateAddressesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :address_type
      t.text :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country

      t.timestamps
    end
  end
end
