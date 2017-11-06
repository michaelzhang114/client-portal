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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170904150018) do
=======
ActiveRecord::Schema.define(version: 20171106173135) do
>>>>>>> flipSession

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "info_content"
    t.integer  "profile_id"
    t.integer  "session_id"
  end

  add_index "comments", ["profile_id"], name: "index_comments_on_profile_id", using: :btree
  add_index "comments", ["session_id"], name: "index_comments_on_session_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "organization_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.string   "email"
    t.string   "avatar"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "profile_id"
    t.text     "highlights"
    t.text     "feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "homework"
    t.boolean  "show_group", default: false
  end

<<<<<<< HEAD
=======
  create_table "videos", force: :cascade do |t|
    t.text     "heading"
    t.text     "link"
    t.integer  "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

>>>>>>> flipSession
  add_foreign_key "comments", "profiles"
  add_foreign_key "comments", "sessions"
end
