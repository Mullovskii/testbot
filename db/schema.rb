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

ActiveRecord::Schema.define(version: 20170320210918) do

  create_table "acts", force: :cascade do |t|
    t.string   "bot_say"
    t.string   "intent"
    t.string   "link"
    t.boolean  "yes_no",     default: false
    t.integer  "lesson_id"
    t.integer  "bot_id"
    t.integer  "user_id"
    t.time     "shoot_at"
    t.boolean  "recurrent",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["bot_id"], name: "index_acts_on_bot_id"
    t.index ["lesson_id"], name: "index_acts_on_lesson_id"
    t.index ["user_id"], name: "index_acts_on_user_id"
  end

  create_table "bot_actions", force: :cascade do |t|
    t.string   "user_input"
    t.string   "bot_response"
    t.string   "intent"
    t.integer  "context_number"
    t.integer  "user_id"
    t.integer  "bot_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["bot_id"], name: "index_bot_actions_on_bot_id"
    t.index ["user_id"], name: "index_bot_actions_on_user_id"
  end

  create_table "bots", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bots_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "user_say"
    t.string   "intent"
    t.boolean  "user_proactive", default: true
    t.integer  "bot_id"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["bot_id"], name: "index_lessons_on_bot_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_says", force: :cascade do |t|
    t.string   "input"
    t.string   "intent"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.integer  "bot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bot_id"], name: "index_user_says_on_bot_id"
    t.index ["lesson_id"], name: "index_user_says_on_lesson_id"
    t.index ["user_id"], name: "index_user_says_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
