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

ActiveRecord::Schema.define(version: 20160729200056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "initial_questionnaires", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "gender"
    t.string   "height"
    t.string   "weight"
    t.text     "how_did_you_find_out"
    t.text     "short_term_goals"
    t.text     "medical_issues"
    t.string   "primary_goal"
    t.string   "current_shape"
    t.string   "applied_before"
    t.text     "give_100_percent"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.date     "date_of_birth"
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

  create_table "testimonials", force: :cascade do |t|
    t.string   "author"
    t.string   "content"
    t.integer  "position",     default: 0
    t.boolean  "show_on_home", default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "user_applications", force: :cascade do |t|
    t.string   "uuid"
    t.json     "initial_questionnaire_attributes"
    t.string   "name"
    t.date     "dob"
    t.string   "height"
    t.integer  "current_weight"
    t.integer  "target_weight"
    t.string   "body_fat"
    t.string   "current_waist_measurement"
    t.string   "contact_number"
    t.string   "email_address"
    t.string   "occupation"
    t.text     "time_at_work_spent"
    t.text     "medical_conditions"
    t.text     "pregnancy"
    t.text     "past_injuries"
    t.text     "medical_issues"
    t.text     "how_did_you_find_out"
    t.text     "short_term_goals"
    t.text     "long_term_goals"
    t.text     "how_healthy_do_you_feel"
    t.text     "alcohol"
    t.text     "smoke"
    t.text     "finances"
    t.text     "last_hour_before_bed"
    t.text     "meal_preperation"
    t.string   "food_shop"
    t.boolean  "stress"
    t.text     "menstrual_cycles"
    t.text     "energy_levels"
    t.text     "working_hours"
    t.text     "struggle_with_sleep"
    t.text     "bed_time"
    t.text     "fall_asleep"
    t.text     "wake_up_through_night"
    t.text     "wake_up_naturally"
    t.text     "sleep_pattern_effected"
    t.text     "eating_pattern"
    t.text     "eating_confidence"
    t.string   "caffeine"
    t.string   "water"
    t.text     "fad_diets"
    t.text     "supplements"
    t.text     "training_split"
    t.text     "enjoying_routine"
    t.text     "training_likes"
    t.text     "training_dislikes"
    t.text     "training_time"
    t.text     "training_improvement_areas"
    t.string   "heart_condition"
    t.string   "chest_pain_when_exercising"
    t.string   "chest_pain_when_not_exercising"
    t.string   "dizziness"
    t.string   "bone_or_joint_problem"
    t.string   "blood_or_heart_medication"
    t.string   "other_medical_issues"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
