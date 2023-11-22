class CreateOrdersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.datetime :order_date
      t.string :status
      t.decimal :total_amount

      t.timestamps
    end
  end
end
