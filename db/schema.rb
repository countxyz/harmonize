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

ActiveRecord::Schema.define(version: 20140504003149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: true do |t|
    t.string  "description"
    t.string  "status"
    t.string  "priority"
    t.date    "start_date"
    t.date    "target_date"
    t.date    "deadline"
    t.date    "completed"
    t.integer "project_id"
    t.string  "notes"
  end

  add_index "assignments", ["project_id"], name: "index_assignments_on_project_id", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secondary_email"
    t.text     "notes"
    t.string   "company"
    t.string   "slug"
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

  create_table "fullcalendar_engine_event_series", force: true do |t|
    t.integer  "frequency",  default: 1
    t.string   "period",     default: "monthly"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fullcalendar_engine_events", force: true do |t|
    t.string   "title"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",         default: false
    t.text     "description"
    t.integer  "event_series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fullcalendar_engine_events", ["event_series_id"], name: "index_fullcalendar_engine_events_on_event_series_id", using: :btree

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
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "employer"
    t.string   "name"
    t.string   "github"
  end

  add_index "projects", ["created_at"], name: "index_projects_on_created_at", order: {"created_at"=>:desc}, using: :btree
  add_index "projects", ["name"], name: "index_projects_on_name", unique: true, using: :btree

  create_table "social_media", force: true do |t|
    t.string   "skype"
    t.string   "google_plus"
    t.string   "github"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "coderwall"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_id"
  end

  add_index "social_media", ["contact_id"], name: "index_social_media_on_contact_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "description"
    t.datetime "deadline"
    t.datetime "completed"
  end

  create_table "users", force: true do |t|
    t.string   "handle"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
