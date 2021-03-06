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

ActiveRecord::Schema.define(version: 20150717041508) do

  create_table "biddings", force: :cascade do |t|
    t.text     "reason"
    t.decimal  "amount"
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_winner",  default: false
  end

  add_index "biddings", ["product_id"], name: "index_biddings_on_product_id"
  add_index "biddings", ["user_id"], name: "index_biddings_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "hidden"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "created_accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.date     "registration_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.string   "question"
    t.string   "answer"
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "inquiries", ["product_id"], name: "index_inquiries_on_product_id"
  add_index "inquiries", ["user_id"], name: "index_inquiries_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "due_date"
    t.string   "state",              default: "active"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "card"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "winners", force: :cascade do |t|
    t.integer  "bidding_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "winners", ["bidding_id"], name: "index_winners_on_bidding_id"

end
