class CreateAdministratorsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :administrators do |t|
      t.boolean :active
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :encrypted_password
      t.string :password

      t.timestamps
    end
  end
end
