# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_29_122538) do
  create_table "addresses", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "address_type"
    t.text "street_address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "address_customer_id_FK"
  end

  create_table "administrators", charset: "utf8mb4", force: :cascade do |t|
    t.boolean "active"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "encrypted_password"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", charset: "utf8mb4", force: :cascade do |t|
    t.integer "product_id"
    t.integer "quantity"
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "cart_customer_id_FK"
    t.index ["product_id"], name: "cart_product_id_FK"
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "administrator_id"
  end

  create_table "customers", charset: "utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "phone_number"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "order_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.decimal "subtotal", precision: 10
    t.decimal "unit_price", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "order_item_order_id_FK"
    t.index ["product_id"], name: "order_item_product_id_FK"
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "customer_id"
    t.datetime "order_date"
    t.string "status"
    t.decimal "total_amount", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "province_id"
    t.index ["customer_id"], name: "order_customer_id_FK"
    t.index ["province_id"], name: "orders_province_id_FK"
  end

  create_table "payments", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "order_id"
    t.datetime "payment_date"
    t.string "payment_method"
    t.decimal "amount", precision: 10
    t.string "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "payment_order_id_FK"
  end

  create_table "product_taxes", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "product_tax_product_id_FK"
    t.index ["tax_id"], name: "product_tax_tax_id_FK"
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 10
    t.integer "stock_quantity"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "administrator_id"
    t.index ["category_id"], name: "product_category_id_FK"
  end

  create_table "provinces", charset: "utf8mb4", force: :cascade do |t|
    t.integer "name"
    t.decimal "tax", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "product_id"
    t.integer "rating"
    t.text "comment"
    t.datetime "date_posted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "review_customer_id_FK"
    t.index ["product_id"], name: "review_product_id_FK"
  end

  create_table "taxes", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.decimal "rate", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "customers", name: "address_customer_id_FK", on_update: :cascade
  add_foreign_key "carts", "customers", name: "cart_customer_id_FK", on_update: :cascade
  add_foreign_key "carts", "products", name: "cart_product_id_FK", on_update: :cascade
  add_foreign_key "order_items", "orders", name: "order_item_order_id_FK", on_update: :cascade
  add_foreign_key "order_items", "products", name: "order_item_product_id_FK", on_update: :cascade
  add_foreign_key "orders", "customers", name: "order_customer_id_FK", on_update: :cascade
  add_foreign_key "orders", "provinces", name: "orders_province_id_FK", on_update: :cascade
  add_foreign_key "payments", "orders", name: "payment_order_id_FK", on_update: :cascade
  add_foreign_key "product_taxes", "products", name: "product_tax_product_id_FK", on_update: :cascade
  add_foreign_key "product_taxes", "taxes", name: "product_tax_tax_id_FK", on_update: :cascade
  add_foreign_key "products", "categories", name: "product_category_id_FK", on_update: :cascade
  add_foreign_key "reviews", "customers", name: "review_customer_id_FK", on_update: :cascade
  add_foreign_key "reviews", "products", name: "review_product_id_FK", on_update: :cascade
end
