class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :category_id, :bigint
    change_column :orders, :customer_id, :bigint
    change_column :order_items, :order_id, :bigint
    change_column :order_items, :product_id, :bigint
    change_column :carts, :customer_id, :bigint
    change_column :carts, :product_id, :bigint
    change_column :reviews, :customer_id, :bigint
    change_column :reviews, :product_id, :bigint
    change_column :addresses, :customer_id, :bigint
    change_column :payments, :order_id, :bigint
    add_foreign_key "products", "categories", column: "category_id", name: "product_category_id_FK", on_update: :cascade
    add_foreign_key "orders", "customers", column: "customer_id", name: "order_customer_id_FK", on_update: :cascade
    add_foreign_key "order_items", "orders", column: "order_id", name: "order_item_order_id_FK", on_update: :cascade
    add_foreign_key "order_items", "products", column: "product_id", name: "order_item_product_id_FK", on_update: :cascade
    add_foreign_key "payments", "orders", column: "order_id", name: "payment_order_id_FK", on_update: :cascade
    add_foreign_key "carts", "customers", column: "customer_id", name: "cart_customer_id_FK", on_update: :cascade
    add_foreign_key "carts", "products", column: "product_id", name: "cart_product_id_FK", on_update: :cascade    
    add_foreign_key "reviews", "customers", column: "customer_id", name: "review_customer_id_FK", on_update: :cascade
    add_foreign_key "reviews", "products", column: "product_id", name: "review_product_id_FK", on_update: :cascade        
    add_foreign_key "addresses", "customers", column: "customer_id", name: "address_customer_id_FK", on_update: :cascade

  end
end
