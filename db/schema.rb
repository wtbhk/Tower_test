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

ActiveRecord::Schema.define(version: 20141014115007) do

  create_table "comments", force: true do |t|
    t.integer  "author_id"
    t.text     "content"
    t.string   "target_type"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "author_id"
    t.text     "author"
    t.integer  "project_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "action"
    t.text     "title"
    t.text     "content"
    t.text     "ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_users", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.string   "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_users", force: true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "access"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todos", force: true do |t|
    t.boolean  "doing"
    t.boolean  "done"
    t.integer  "owner_id"
    t.datetime "deadline"
    t.text     "title"
    t.integer  "project_id"
    t.boolean  "deleted"
    t.datetime "deltime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.text     "name"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
