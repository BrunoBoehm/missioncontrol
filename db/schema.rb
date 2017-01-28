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

ActiveRecord::Schema.define(version: 20170128223202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_pins", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "pin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "img"
    t.string   "color"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "pitch"
    t.string   "address"
    t.string   "size"
    t.integer  "creation_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perso_links", force: :cascade do |t|
    t.integer  "pin_id"
    t.integer  "person_id"
    t.string   "nature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pin_tags", force: :cascade do |t|
    t.integer  "pin_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pins", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.text     "notes"
    t.string   "imgs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pro_links", force: :cascade do |t|
    t.integer  "pin_id"
    t.integer  "company_id"
    t.string   "nature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_profiles", force: :cascade do |t|
    t.string   "fb_url"
    t.string   "tw_url"
    t.string   "ln_url"
    t.string   "ig_url"
    t.string   "yt_url"
    t.string   "db_url"
    t.integer  "person_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffings", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "company_id"
    t.boolean  "actual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
