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

ActiveRecord::Schema.define(version: 20170703203941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.string "project_length"
    t.integer "workforce_size"
    t.date "auction_start_date", null: false
    t.date "auction_close_date", null: false
    t.string "description", default: "", null: false
    t.integer "user_id"
    t.integer "bid_id"
  end

  create_table "bids", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "auction_id", null: false
    t.integer "bid_quote", null: false
    t.boolean "winning_bid", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "contact_first_name", null: false
    t.string "contact_last_name", null: false
    t.string "company_website"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
