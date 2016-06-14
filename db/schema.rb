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

ActiveRecord::Schema.define(version: 20160614120825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "initial_questionnaires", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "gender"
    t.string   "height"
    t.string   "weight"
    t.integer  "age"
    t.text     "how_did_you_find_out"
    t.text     "short_term_goals"
    t.text     "medical_issues"
    t.string   "primary_goal"
    t.string   "current_shape"
    t.string   "applied_before"
    t.text     "give_100_percent"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "slug"
    t.jsonb    "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "smug_administrators", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "smug_administrators", ["email"], name: "index_smug_administrators_on_email", unique: true, using: :btree
  add_index "smug_administrators", ["reset_password_token"], name: "index_smug_administrators_on_reset_password_token", unique: true, using: :btree

  create_table "smug_pages", force: :cascade do |t|
    t.jsonb    "json_attributes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
