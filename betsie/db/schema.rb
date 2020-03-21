# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_19_094644) do

  create_table "challenges", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "challenger_id"
    t.integer "wager_id", null: false
    t.integer "payment_id", null: false
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "winner", default: 0
    t.string "status", default: "pending"
    t.index ["payment_id"], name: "index_challenges_on_payment_id"
    t.index ["user_id"], name: "index_challenges_on_user_id"
    t.index ["wager_id"], name: "index_challenges_on_wager_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wagers", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "challenges", "payments"
  add_foreign_key "challenges", "users"
  add_foreign_key "challenges", "wagers"
end
