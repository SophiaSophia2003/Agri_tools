class CreateOrderItemsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items_tables do |t|

      t.timestamps
    end
  end
end
