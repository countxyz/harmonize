ActiveRecord::Schema.define(version: 20131224104938) do

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secondary_email"
    t.text     "notes"
  end

  create_table "event_series", force: true do |t|
    t.integer  "frequency",  default: 1
    t.string   "period",     default: "monthly"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",         default: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_series_id"
  end

  add_index "events", ["event_series_id"], name: "index_events_on_event_series_id", using: :btree

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
  end

  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree

end
