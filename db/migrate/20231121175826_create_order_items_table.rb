class CreateOrderItemsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :subtotal
      t.decimal :unit_price

      t.timestamps
    end
  end
end
