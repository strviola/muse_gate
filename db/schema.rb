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

ActiveRecord::Schema.define(version: 20171021031830) do

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "postcode", null: false
    t.integer "prefecture_id", null: false
    t.string "city", null: false
    t.string "detail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_addresses_on_prefecture_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "name", null: false
    t.integer "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_hosts_on_account_id"
    t.index ["address_id"], name: "index_hosts_on_address_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name", null: false
    t.integer "room_id"
    t.integer "available_time", null: false
    t.integer "price", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_plans_on_room_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "account_id"
    t.integer "address_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_players_on_account_id"
    t.index ["address_id"], name: "index_players_on_address_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "plan_id", null: false
    t.integer "room_id", null: false
    t.integer "player_id", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_reservations_on_plan_id"
    t.index ["player_id"], name: "index_reservations_on_player_id"
    t.index ["room_id"], name: "index_reservations_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "host_id", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "address_id", null: false
    t.boolean "has_piano", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_rooms_on_address_id"
    t.index ["host_id"], name: "index_rooms_on_host_id"
  end

end
