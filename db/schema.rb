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

ActiveRecord::Schema.define(version: 20170203101005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.float    "umami"
    t.float    "sweet"
    t.float    "spicy"
    t.float    "sour"
    t.float    "bitter"
    t.float    "fat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pairing_id"
    t.index ["pairing_id"], name: "index_foods_on_pairing_id", using: :btree
  end

  create_table "pairings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "food_id"
    t.index ["food_id"], name: "index_pairings_on_food_id", using: :btree
  end

  create_table "wines", force: :cascade do |t|
    t.string   "name"
    t.float    "sweet"
    t.float    "herby"
    t.float    "bitter"
    t.float    "fruity"
    t.float    "oaky"
    t.float    "alcohol"
    t.float    "acid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "foods", "pairings"
  add_foreign_key "pairings", "foods"
end
