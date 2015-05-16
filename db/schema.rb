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

ActiveRecord::Schema.define(version: 20150516024127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courts", force: :cascade do |t|
    t.integer  "park_id"
    t.string   "img"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "court_number", default: 0
  end

  add_index "courts", ["park_id"], name: "index_courts_on_park_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "court_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "time"
    t.time     "opening_time"
    t.time     "closing_time"
    t.integer  "game_length"
  end

  add_index "games", ["court_id"], name: "index_games_on_court_id", using: :btree

  create_table "games_users", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  add_index "games_users", ["game_id"], name: "index_games_users_on_game_id", using: :btree
  add_index "games_users", ["user_id"], name: "index_games_users_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["game_id"], name: "index_messages_on_game_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "parks", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "court_count", default: 0
    t.string   "img"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "image"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "courts", "parks"
  add_foreign_key "games_users", "games"
  add_foreign_key "games_users", "users"
  add_foreign_key "messages", "games"
  add_foreign_key "messages", "users"
end
