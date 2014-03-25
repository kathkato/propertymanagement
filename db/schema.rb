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

ActiveRecord::Schema.define(version: 20140319205358) do

  create_table "leases", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "rent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_id"
  end

  create_table "payment_transactions", force: true do |t|
    t.text     "response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_id"
  end

  create_table "payments", force: true do |t|
    t.integer  "amount"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "card_expires_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "lease_id"
  end

  create_table "properties", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repair_requests", force: true do |t|
    t.date     "open_date"
    t.date     "close_date"
    t.text     "request_details"
    t.text     "request_response"
    t.integer  "submitter_id"
    t.integer  "responder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "units", force: true do |t|
    t.string   "name"
    t.integer  "square_feet"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lease_id"
  end

end
