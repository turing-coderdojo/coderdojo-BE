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

ActiveRecord::Schema.define(version: 2019_07_23_155319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievement_goals", force: :cascade do |t|
    t.bigint "achievement_id"
    t.bigint "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievement_id"], name: "index_achievement_goals_on_achievement_id"
    t.index ["goal_id"], name: "index_achievement_goals_on_goal_id"
  end

  create_table "achievements", force: :cascade do |t|
    t.bigint "venue_id"
    t.string "name"
    t.string "badge_url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_achievements_on_venue_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street_1"
    t.string "street_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "venue_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "notes"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_code"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.text "description"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_achv_goals", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "achievement_goal_id"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.boolean "notified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievement_goal_id"], name: "index_student_achv_goals_on_achievement_goal_id"
    t.index ["user_id"], name: "index_student_achv_goals_on_user_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.integer "role"
    t.string "name"
    t.text "notes"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "guardian_id"
    t.string "birthdate"
    t.index ["guardian_id"], name: "index_users_on_guardian_id"
  end

  create_table "venue_admins", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "venue_id"
    t.index ["user_id"], name: "index_venue_admins_on_user_id"
    t.index ["venue_id"], name: "index_venue_admins_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.text "notes"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "web_url"
    t.string "photo_url"
  end

  add_foreign_key "achievement_goals", "achievements"
  add_foreign_key "achievement_goals", "goals"
  add_foreign_key "achievements", "venues"
  add_foreign_key "events", "venues"
  add_foreign_key "student_achv_goals", "achievement_goals"
  add_foreign_key "student_achv_goals", "users"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
  add_foreign_key "venue_admins", "users"
  add_foreign_key "venue_admins", "venues"
end
