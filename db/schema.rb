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

ActiveRecord::Schema.define(version: 20151209115135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attempts", force: :cascade do |t|
    t.integer  "test_id"
    t.integer  "user_id"
    t.integer  "score"
    t.integer  "place"
    t.boolean  "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "incorrect"
  end

  add_index "attempts", ["test_id"], name: "index_attempts_on_test_id", using: :btree
  add_index "attempts", ["user_id"], name: "index_attempts_on_user_id", using: :btree

  create_table "choices", force: :cascade do |t|
    t.integer  "question_id"
    t.boolean  "is_correct"
    t.string   "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id", using: :btree

  create_table "contact_messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forum_boards", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forum_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "forum_topic_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "forum_posts", ["forum_topic_id"], name: "index_forum_posts_on_forum_topic_id", using: :btree
  add_index "forum_posts", ["user_id"], name: "index_forum_posts_on_user_id", using: :btree

  create_table "forum_topics", force: :cascade do |t|
    t.string   "name"
    t.integer  "forum_board_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "forum_topics", ["forum_board_id"], name: "index_forum_topics_on_forum_board_id", using: :btree
  add_index "forum_topics", ["user_id"], name: "index_forum_topics_on_user_id", using: :btree

  create_table "payment_notifications", force: :cascade do |t|
    t.text     "params"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "test_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["test_id"], name: "index_questions_on_test_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "code"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "package"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "attempts", "tests"
  add_foreign_key "attempts", "users"
  add_foreign_key "choices", "questions"
  add_foreign_key "forum_posts", "forum_topics"
  add_foreign_key "forum_posts", "users"
  add_foreign_key "forum_topics", "forum_boards"
  add_foreign_key "forum_topics", "users"
  add_foreign_key "questions", "tests"
end
