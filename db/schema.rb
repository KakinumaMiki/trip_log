# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_05_03_053742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "label"
    t.integer "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "memories", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.date "went_on", null: false
    t.string "with_who"
    t.text "comment"
    t.decimal "star", null: false
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_memories_on_place_id"
  end

  create_table "place_schedules", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "schedule_id", null: false
    t.time "start_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_place_schedules_on_place_id"
    t.index ["schedule_id"], name: "index_place_schedules_on_schedule_id"
  end

  create_table "places", force: :cascade do |t|
    t.bigint "prefecture_id", null: false
    t.bigint "category_id", null: false
    t.string "name", null: false
    t.string "address"
    t.boolean "gone", null: false
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.boolean "status"
    t.index ["category_id"], name: "index_places_on_category_id"
    t.index ["prefecture_id"], name: "index_places_on_prefecture_id"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.string "with_who"
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.boolean "status"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.string "name", null: false
    t.text "memo"
    t.date "went_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plan_id"], name: "index_schedules_on_plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "code"
    t.string "password_digest"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_users_on_code", unique: true
  end

  add_foreign_key "memories", "places"
  add_foreign_key "place_schedules", "places"
  add_foreign_key "place_schedules", "schedules"
  add_foreign_key "places", "categories"
  add_foreign_key "places", "prefectures"
  add_foreign_key "schedules", "plans"
end
