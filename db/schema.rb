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

ActiveRecord::Schema.define(version: 20170201102202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "board_pins", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "pin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "board_pins", ["board_id"], name: "index_board_pins_on_board_id", using: :btree
  add_index "board_pins", ["pin_id"], name: "index_board_pins_on_pin_id", using: :btree

  create_table "boards", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "img"
    t.string   "color"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "account_id"
  end

  add_index "boards", ["account_id"], name: "index_boards_on_account_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "pitch"
    t.string   "address"
    t.string   "size"
    t.integer  "creation_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "account_id"
  end

  add_index "companies", ["account_id"], name: "index_companies_on_account_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  add_index "people", ["account_id"], name: "index_people_on_account_id", using: :btree

  create_table "perso_links", force: :cascade do |t|
    t.integer  "pin_id"
    t.integer  "person_id"
    t.string   "nature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "perso_links", ["person_id"], name: "index_perso_links_on_person_id", using: :btree
  add_index "perso_links", ["pin_id"], name: "index_perso_links_on_pin_id", using: :btree

  create_table "pins", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.text     "notes"
    t.string   "imgs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  add_index "pins", ["account_id"], name: "index_pins_on_account_id", using: :btree

  create_table "pro_links", force: :cascade do |t|
    t.integer  "pin_id"
    t.integer  "company_id"
    t.string   "nature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pro_links", ["company_id"], name: "index_pro_links_on_company_id", using: :btree
  add_index "pro_links", ["pin_id"], name: "index_pro_links_on_pin_id", using: :btree

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

  add_index "social_profiles", ["company_id"], name: "index_social_profiles_on_company_id", using: :btree
  add_index "social_profiles", ["person_id"], name: "index_social_profiles_on_person_id", using: :btree

  create_table "staffings", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "company_id"
    t.boolean  "actual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "staffings", ["company_id"], name: "index_staffings_on_company_id", using: :btree
  add_index "staffings", ["person_id"], name: "index_staffings_on_person_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "taggable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  add_index "tags", ["account_id"], name: "index_tags_on_account_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "surname"
    t.integer  "account_id"
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

  add_index "users", ["account_id"], name: "index_users_on_account_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
