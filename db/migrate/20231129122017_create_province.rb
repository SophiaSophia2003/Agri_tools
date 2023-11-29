class CreateProvince < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.integer :name
      t.decimal :tax

      t.timestamps
    end
  end
end
