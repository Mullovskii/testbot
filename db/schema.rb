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

ActiveRecord::Schema.define(version: 20170428182702) do

  create_table "acts", force: :cascade do |t|
    t.string   "bot_say"
    t.string   "intent"
    t.integer  "sequence"
    t.boolean  "waiting_response"
    t.integer  "lesson_id"
    t.integer  "bot_id"
    t.integer  "user_id"
    t.boolean  "proactive",        default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["bot_id"], name: "index_acts_on_bot_id"
    t.index ["lesson_id"], name: "index_acts_on_lesson_id"
    t.index ["user_id"], name: "index_acts_on_user_id"
  end

  create_table "attachements", force: :cascade do |t|
    t.integer  "bot_action_id"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "bot_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["bot_action_id"], name: "index_attachements_on_bot_action_id"
    t.index ["bot_id"], name: "index_attachements_on_bot_id"
  end

  create_table "bot_actions", force: :cascade do |t|
    t.string   "user_input"
    t.string   "bot_response"
    t.string   "intent"
    t.integer  "lesson_id"
    t.integer  "sequence"
    t.boolean  "waiting_response"
    t.integer  "user_id"
    t.integer  "bot_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["bot_id"], name: "index_bot_actions_on_bot_id"
    t.index ["user_id"], name: "index_bot_actions_on_user_id"
  end

  create_table "bots", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_bots_on_user_id"
  end

  create_table "checks", force: :cascade do |t|
    t.integer  "bot_id"
    t.integer  "lesson_id"
    t.string   "name"
    t.string   "key"
    t.string   "intent"
    t.integer  "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bot_id"], name: "index_checks_on_bot_id"
    t.index ["lesson_id"], name: "index_checks_on_lesson_id"
  end

  create_table "entities", force: :cascade do |t|
    t.string   "name"
    t.string   "key"
    t.integer  "user_id"
    t.integer  "bot_id"
    t.string   "intent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bot_id"], name: "index_entities_on_bot_id"
    t.index ["user_id"], name: "index_entities_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "bot_id"
    t.integer  "lesson_id"
    t.string   "intent"
    t.integer  "sequence"
    t.string   "name"
    t.string   "place"
    t.text     "description"
    t.string   "organizer"
    t.boolean  "free"
    t.integer  "price"
    t.string   "link"
    t.string   "photo"
    t.string   "token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["bot_id"], name: "index_events_on_bot_id"
    t.index ["lesson_id"], name: "index_events_on_lesson_id"
  end

  create_table "keys", force: :cascade do |t|
    t.integer  "user_say_id"
    t.integer  "bot_id"
    t.integer  "lesson_id"
    t.string   "name"
    t.integer  "sequence"
    t.string   "intent"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["bot_id"], name: "index_keys_on_bot_id"
    t.index ["lesson_id"], name: "index_keys_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "intent"
    t.boolean  "user_proactive", default: true
    t.integer  "bot_id"
    t.integer  "user_id"
    t.boolean  "extract_data",   default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["bot_id"], name: "index_lessons_on_bot_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "bot_id"
    t.integer  "lesson_id"
    t.string   "intent"
    t.string   "filter"
    t.integer  "sequence"
    t.boolean  "waiting_response"
    t.string   "title"
    t.text     "body"
    t.string   "link"
    t.string   "photo"
    t.string   "token"
    t.boolean  "proactive",        default: false
    t.boolean  "rss",              default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["bot_id"], name: "index_posts_on_bot_id"
    t.index ["lesson_id"], name: "index_posts_on_lesson_id"
  end

  create_table "samples", force: :cascade do |t|
    t.integer  "user_say_id"
    t.integer  "bot_id"
    t.integer  "key_id"
    t.string   "name"
    t.string   "key_name"
    t.integer  "sequence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["bot_id"], name: "index_samples_on_bot_id"
    t.index ["key_id"], name: "index_samples_on_key_id"
    t.index ["user_say_id"], name: "index_samples_on_user_say_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "bot_id"
    t.integer  "lesson_id"
    t.string   "intent"
    t.integer  "sequence"
    t.boolean  "waiting_response"
    t.integer  "time"
    t.boolean  "repeat"
    t.boolean  "repeat_daily"
    t.integer  "remind_over"
    t.boolean  "sunday"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["bot_id"], name: "index_schedules_on_bot_id"
    t.index ["lesson_id"], name: "index_schedules_on_lesson_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bot_id"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bot_id"], name: "index_subscriptions_on_bot_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "user_says", force: :cascade do |t|
    t.string   "input"
    t.string   "regexp"
    t.string   "intent"
    t.boolean  "waiting_response"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.integer  "bot_id"
    t.boolean  "extract_data",     default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
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
