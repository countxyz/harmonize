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

ActiveRecord::Schema.define(version: 20140224200210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secondary_email"
    t.text     "notes"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.boolean  "all_day",     default: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "phones", force: true do |t|
    t.integer  "contact_id"
    t.string   "mobile"
    t.string   "office"
    t.string   "fax"
    t.string   "home"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "status"
    t.string   "priority"
    t.date     "start_date"
    t.date     "target_date"
    t.date     "deadline"
    t.date     "completion_date"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "website"
  end

  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree

end
