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

ActiveRecord::Schema.define(version: 20130519055501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id", using: :btree
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "subdomain",  null: false
    t.string   "name",       null: false
    t.string   "time_zone",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["subdomain"], name: "index_cities_on_subdomain", unique: true, using: :btree

  create_table "events", force: true do |t|
    t.integer  "city_id",                         null: false
    t.datetime "start",                           null: false
    t.datetime "end",                             null: false
    t.integer  "sponsor_id"
    t.integer  "location_id"
    t.integer  "organizer_id"
    t.text     "food"
    t.boolean  "draft",            default: true, null: false
    t.integer  "beginner_talk_id"
    t.integer  "advanced_talk_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "events", ["advanced_talk_id"], name: "index_events_on_advanced_talk_id", using: :btree
  add_index "events", ["beginner_talk_id"], name: "index_events_on_beginner_talk_id", using: :btree
  add_index "events", ["city_id"], name: "index_events_on_city_id", using: :btree
  add_index "events", ["location_id"], name: "index_events_on_location_id", using: :btree
  add_index "events", ["organizer_id"], name: "index_events_on_organizer_id", using: :btree
  add_index "events", ["sponsor_id"], name: "index_events_on_sponsor_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.integer  "city_id",    null: false
    t.text     "notes"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["city_id"], name: "index_locations_on_city_id", using: :btree

  create_table "sponsors", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talks", force: true do |t|
    t.integer  "city_id",                     null: false
    t.integer  "user_id",                     null: false
    t.boolean  "newbie",      default: false, null: false
    t.string   "title",                       null: false
    t.text     "description",                 null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "talks", ["city_id"], name: "index_talks_on_city_id", using: :btree
  add_index "talks", ["user_id"], name: "index_talks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                       null: false
    t.string   "twitter",                    null: false
    t.string   "email"
    t.string   "avatar",                     null: false
    t.string   "bio"
    t.string   "location"
    t.string   "url"
    t.boolean  "admin",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["twitter"], name: "index_users_on_twitter", unique: true, using: :btree

end
