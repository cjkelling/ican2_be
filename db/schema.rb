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

ActiveRecord::Schema.define(version: 2020_02_18_190001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.integer "mentee_id"
    t.integer "mentor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.integer "meetup_radius"
    t.string "field_of_interest"
    t.text "about_me"
    t.string "gender"
    t.string "image"
    t.boolean "mentor"
    t.string "field_of_knowledge"
    t.string "experience_level"
    t.text "work_day_question"
    t.text "enjoyment_question"
    t.text "teaching_points_question"
    t.text "advice_question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zip_code"
    t.integer "age"
  end

end
