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

ActiveRecord::Schema.define(version: 20180130014312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleges", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_colleges_on_user_id"
  end

  create_table "flex_hours", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "week_id"
    t.text "reason"
    t.integer "num_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flex_hours_on_user_id"
    t.index ["week_id"], name: "index_flex_hours_on_week_id"
  end

  create_table "forms", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.boolean "archive", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "required", default: false, null: false
  end

  create_table "forms_users", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "form_id"
    t.index ["form_id"], name: "index_forms_users_on_form_id"
    t.index ["user_id"], name: "index_forms_users_on_user_id"
  end

  create_table "hour_exceptions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "submitter", limit: 255
    t.date "date_applicable"
    t.date "date_sent"
    t.text "reason"
    t.integer "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "week_id"
    t.boolean "made_up_hours", default: false, null: false
    t.index ["user_id"], name: "index_hour_exceptions_on_user_id"
    t.index ["year_id"], name: "index_hour_exceptions_on_year_id"
  end

  create_table "hour_overrides", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "year_id"
    t.integer "hours_required"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hour_overrides_on_user_id"
    t.index ["year_id"], name: "index_hour_overrides_on_year_id"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.text "message"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "requirements", id: :serial, force: :cascade do |t|
    t.integer "pre_meetings"
    t.integer "pre_hours"
    t.integer "build_meetings"
    t.integer "freshman_hours"
    t.integer "sophomore_hours"
    t.integer "junior_hours"
    t.integer "senior_hours"
    t.integer "leadership_hours"
    t.integer "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_flex_hours"
    t.index ["year_id"], name: "index_requirements_on_year_id"
  end

  create_table "schools", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timelogs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "timein"
    t.datetime "timeout"
    t.integer "time_logged"
    t.datetime "updated_at"
    t.integer "year_id"
    t.integer "week_id"
    t.index ["user_id"], name: "index_timelogs_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "phone", limit: 255
    t.string "name_first", limit: 255
    t.string "name_last", limit: 255
    t.string "userid", limit: 255
    t.integer "school_id"
    t.boolean "tools"
    t.boolean "conduct"
    t.boolean "basicSafety"
    t.string "password_salt", limit: 255
    t.string "password_hash", limit: 255
    t.boolean "archive", default: false, null: false
    t.string "location", limit: 255
    t.string "gender", limit: 255
    t.string "graduation_year", limit: 255
    t.boolean "student_leader"
    t.boolean "read_only", default: false, null: false
    t.boolean "member"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "week_exceptions", id: :serial, force: :cascade do |t|
    t.date "date"
    t.decimal "weight"
    t.text "reason"
    t.integer "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "week_id"
    t.index ["year_id"], name: "index_week_exceptions_on_year_id"
  end

  create_table "weeks", id: :serial, force: :cascade do |t|
    t.date "week_start"
    t.date "week_end"
    t.string "season"
    t.integer "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year_id"], name: "index_weeks_on_year_id"
  end

  create_table "years", id: :serial, force: :cascade do |t|
    t.date "year_start"
    t.date "year_end"
    t.date "build_season_start"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "preseason_start"
  end

  create_table "laptimelogs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "timein"
    t.datetime "timeout"
    t.integer "time_logged"
    t.datetime "updated_at"
    t.integer "year_id"
    t.integer "week_id"
    t.integer "laptop_id"
    t.index ["user_id"], name: "index_timelogs_on_user_id"
  end

  add_foreign_key "colleges", "users"
  add_foreign_key "flex_hours", "users"
  add_foreign_key "flex_hours", "weeks"
  add_foreign_key "messages", "users"
  add_foreign_key "requirements", "years"
  add_foreign_key "weeks", "years"
end
