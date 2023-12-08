class ChangeDatatypeOfnameInProvincesTable < ActiveRecord::Migration[7.0]
  def change
     change_column :provinces, :name, :string, limit: 255

  end
end
