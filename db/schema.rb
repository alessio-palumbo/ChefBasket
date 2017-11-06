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

ActiveRecord::Schema.define(version: 20171106013148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_businesses", force: :cascade do |t|
    t.string "business_name"
    t.string "address"
    t.string "abn_number"
    t.string "contact_number"
    t.string "business_category"
    t.string "email"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_food_businesses_on_user_id"
  end

  create_table "food_businesses_suppliers", id: false, force: :cascade do |t|
    t.bigint "food_business_id", null: false
    t.bigint "supplier_id", null: false
    t.index ["food_business_id", "supplier_id"], name: "idx_food_business_supplier"
    t.index ["supplier_id", "food_business_id"], name: "idx_supplier_food_business"
  end

  create_table "orders", force: :cascade do |t|
    t.date "date"
    t.bigint "food_business_id"
    t.bigint "supplier_id"
    t.decimal "gross_total"
    t.decimal "gst"
    t.string "order_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_business_id"], name: "index_orders_on_food_business_id"
    t.index ["supplier_id"], name: "index_orders_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "business_name"
    t.string "address"
    t.string "abn_number"
    t.string "contact_number"
    t.string "supplier_type"
    t.string "email"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_suppliers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "company_name"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "food_businesses", "users"
  add_foreign_key "orders", "food_businesses"
  add_foreign_key "orders", "suppliers"
  add_foreign_key "suppliers", "users"
end
