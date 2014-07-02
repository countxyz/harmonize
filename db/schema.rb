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

ActiveRecord::Schema.define(version: 20140701222005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name",                    null: false
    t.string   "website",    default: "", null: false
    t.text     "notes",      default: "", null: false
    t.string   "slug",                    null: false
    t.integer  "user_id"
  end

  add_index "accounts", ["slug"], name: "index_accounts_on_slug", unique: true, using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "addresses", force: true do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "street_1",                      null: false
    t.string   "street_2",         default: "", null: false
    t.string   "city",                          null: false
    t.string   "state",                         null: false
    t.string   "postal_code",                   null: false
    t.string   "country",                       null: false
    t.string   "type",                          null: false
    t.integer  "addressable_id"
    t.string   "addressable_type"
  end

  add_index "addresses", ["addressable_id", "addressable_type"], name: "index_addresses_on_addressable_id_and_addressable_type", using: :btree

  create_table "contacts", force: true do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "first_name",              null: false
    t.string   "last_name",  default: "", null: false
    t.string   "company",    default: "", null: false
    t.text     "notes",      default: "", null: false
    t.string   "slug",                    null: false
    t.integer  "user_id"
  end

  add_index "contacts", ["slug"], name: "index_contacts_on_slug", unique: true, using: :btree
  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "emails", force: true do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "address",        null: false
    t.integer  "emailable_id"
    t.string   "emailable_type"
  end

  add_index "emails", ["emailable_id", "emailable_type"], name: "index_emails_on_emailable_id_and_emailable_type", using: :btree

  create_table "events", force: true do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name",                        null: false
    t.datetime "start"
    t.datetime "finish"
    t.text     "description",                 null: false
    t.boolean  "all_day",     default: false, null: false
    t.integer  "user_id"
  end

  add_index "events", ["name"], name: "index_events_on_name", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "phones", force: true do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "mobile",         default: "", null: false
    t.string   "office",         default: "", null: false
    t.string   "fax",            default: "", null: false
    t.string   "home",           default: "", null: false
    t.string   "toll",           default: "", null: false
    t.integer  "phoneable_id",                null: false
    t.string   "phoneable_type",              null: false
  end

  add_index "phones", ["phoneable_id", "phoneable_type"], name: "index_phones_on_phoneable_id_and_phoneable_type", using: :btree

  create_table "social_media", force: true do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "google_plus",   default: "", null: false
    t.string   "github",        default: "", null: false
    t.string   "twitter",       default: "", null: false
    t.string   "skype",         default: "", null: false
    t.string   "coderwall",     default: "", null: false
    t.string   "linkedin",      default: "", null: false
    t.string   "facebook",      default: "", null: false
    t.integer  "sociable_id",                null: false
    t.string   "sociable_type",              null: false
  end

  add_index "social_media", ["sociable_id", "sociable_type"], name: "index_social_media_on_sociable_id_and_sociable_type", using: :btree

  create_table "tasks", force: true do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description", null: false
    t.datetime "deadline"
    t.datetime "completed"
    t.integer  "user_id"
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "handle",                          null: false
    t.string   "first_name",      default: "",    null: false
    t.string   "last_name",       default: "",    null: false
    t.string   "password_digest",                 null: false
    t.boolean  "admin",           default: false, null: false
    t.string   "slug",                            null: false
  end

  add_index "users", ["handle"], name: "index_users_on_handle", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

end
