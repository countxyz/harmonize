ActiveRecord::Schema.define(version: 20140406005844) do

  enable_extension "plpgsql"

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

  add_index "projects", ["name"], name: "index_projects_on_name", unique: true, using: :btree

  create_table "tasks", force: true do |t|
    t.string   "description"
    t.datetime "deadline"
    t.datetime "completed"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
