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

ActiveRecord::Schema.define(version: 20150903183721) do

  create_table "line_items", force: :cascade do |t|
    t.integer  "receivable_id"
    t.string   "itemname"
    t.text     "description"
    t.integer  "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "line_items", ["receivable_id"], name: "index_line_items_on_receivable_id"

  create_table "payables", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "vendor"
    t.date     "date"
    t.date     "duedate"
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "paid"
  end

  add_index "payables", ["property_id"], name: "index_payables_on_property_id"

  create_table "properties", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.integer  "totalsqft"
    t.integer  "mortgage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "company"
  end

  add_index "properties", ["user_id"], name: "index_properties_on_user_id"

  create_table "receivables", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "payer"
    t.integer  "amount"
    t.date     "date"
    t.date     "duedate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "received"
  end

  add_index "receivables", ["property_id"], name: "index_receivables_on_property_id"

  create_table "requests", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "completed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "requests", ["tenant_id"], name: "index_requests_on_tenant_id"

  create_table "tenants", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "name"
    t.datetime "leasestart"
    t.datetime "leaseend"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tenants", ["property_id"], name: "index_tenants_on_property_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
