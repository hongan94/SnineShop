# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160928085947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "cart_items", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "name"
    t.string   "size"
    t.integer  "price"
    t.boolean  "status"
  end

  add_index "cart_items", ["user_id"], name: "index_cart_items_on_user_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "transaction_id"
    t.integer  "sub_product_id"
    t.integer  "quantity"
    t.integer  "amount"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "orders", ["sub_product_id"], name: "index_orders_on_sub_product_id", using: :btree
  add_index "orders", ["transaction_id"], name: "index_orders_on_transaction_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.integer  "price"
    t.integer  "quantity"
    t.string   "detail"
    t.string   "origin"
    t.boolean  "status"
    t.integer  "discount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "sub_products", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.integer  "price"
    t.integer  "quantity"
    t.string   "detail"
    t.string   "origin"
    t.boolean  "status"
    t.integer  "discount"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image"
    t.integer  "view",       default: 0
  end

  add_index "sub_products", ["product_id"], name: "index_sub_products_on_product_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "status"
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.integer  "amount"
    t.string   "payment"
    t.string   "payment_info"
    t.string   "message"
    t.string   "security"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "gender"
    t.string   "phone"
    t.string   "address"
    t.date     "birthday"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cart_items", "users"
  add_foreign_key "orders", "sub_products"
  add_foreign_key "orders", "transactions"
  add_foreign_key "products", "categories"
  add_foreign_key "sub_products", "products"
  add_foreign_key "transactions", "users"
end
