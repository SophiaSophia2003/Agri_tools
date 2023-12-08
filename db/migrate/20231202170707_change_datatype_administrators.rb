class ChangeDatatypeAdministrators < ActiveRecord::Migration[7.0]
  def change
     change_column :administrators, :encrypted_password, :string, limit: 255
  end
end
