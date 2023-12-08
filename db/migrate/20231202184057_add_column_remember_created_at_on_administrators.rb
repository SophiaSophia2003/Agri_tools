class AddColumnRememberCreatedAtOnAdministrators < ActiveRecord::Migration[7.0]
  def change
    add_column :administrators, :remember_created_at, :datetime
  end
end
