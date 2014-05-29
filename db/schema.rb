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

ActiveRecord::Schema.define(version: 20140529061903) do

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
    t.string   "slug"
  end

  add_index "accounts", ["slug"], name: "index_accounts_on_slug", unique: true, using: :btree

  create_table "addresses", force: true do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "street_1",                 null: false
    t.string   "street_2",    default: "", null: false
    t.string   "city",                     null: false
    t.string   "state",                    null: false
    t.integer  "postal_code",              null: false
    t.string   "country",                  null: false
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
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "name",                            null: false
    t.string   "employer",           default: "", null: false
    t.string   "website",            default: "", null: false
    t.string   "github",             default: "", null: false
    t.string   "image_file_name",    default: "", null: false
    t.string   "image_content_type", default: "", null: false
    t.integer  "image_file_size",                 null: false
    t.datetime "image_updated_at",                null: false
    t.text     "notes",              default: "", null: false
    t.string   "slug",                            null: false
  end

  add_index "projects", ["created_at"], name: "index_projects_on_created_at", order: {"created_at"=>:desc}, using: :btree
  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree
  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "handle",                       null: false
    t.string   "email",           default: "", null: false
    t.string   "first_name",      default: "", null: false
    t.string   "last_name",       default: "", null: false
    t.string   "password_digest",              null: false
  end

  add_index "users", ["handle"], name: "index_users_on_handle", unique: true, using: :btree

end
