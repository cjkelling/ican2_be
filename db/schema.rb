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

ActiveRecord::Schema.define(version: 2020_02_18_204253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.integer "mentee_id"
    t.integer "mentor_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.integer "meetup_radius"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "mentor_profiles", force: :cascade do |t|
    t.string "field_of_knowledge"
    t.string "experience_level"
    t.text "work_day_question"
    t.text "enjoyment_question"
    t.text "teaching_points_question"
    t.text "advice_question"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mentor_profiles_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "age"
    t.string "gender"
    t.text "about_me"
    t.string "image"
    t.string "field_of_interest"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "mentor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "locations", "users"
  add_foreign_key "mentor_profiles", "users"
  add_foreign_key "profiles", "users"
end
