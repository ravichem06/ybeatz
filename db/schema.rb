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

ActiveRecord::Schema.define(version: 20160301160642) do

  create_table "blogs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communities", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.string   "title",                   limit: 255
    t.string   "content",                 limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "post_image_file_name",    limit: 255
    t.string   "post_image_content_type", limit: 255
    t.integer  "post_image_file_size",    limit: 4
    t.datetime "post_image_updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "message",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "event_name",          limit: 255
    t.datetime "date"
    t.string   "city",                limit: 255
    t.string   "day_date",            limit: 255
    t.string   "description",         limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "country",             limit: 25
    t.string   "state",               limit: 25
    t.string   "venue",               limit: 25
    t.string   "banner_file_name",    limit: 255
    t.string   "banner_content_type", limit: 255
    t.integer  "banner_file_size",    limit: 4
    t.datetime "banner_updated_at"
    t.string   "tagline",             limit: 255
    t.datetime "doors_open"
    t.integer  "ticket_price",        limit: 4
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
