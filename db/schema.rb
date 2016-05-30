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

ActiveRecord::Schema.define(version: 20160530090140) do

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content",      limit: 65535
    t.integer  "community_id", limit: 4
    t.integer  "member_id",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "commenter",    limit: 255
    t.string   "email",        limit: 255
  end

  add_index "comments", ["community_id"], name: "index_comments_on_community_id", using: :btree
  add_index "comments", ["member_id"], name: "index_comments_on_member_id", using: :btree

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
    t.integer  "member_id",               limit: 4
    t.string   "slug",                    limit: 191
  end

  add_index "communities", ["member_id"], name: "index_communities_on_member_id", using: :btree
  add_index "communities", ["slug"], name: "index_communities_on_slug", unique: true, using: :btree

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

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 191, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 191
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "email",                  limit: 191, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 191
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "surname",                limit: 255
    t.integer  "role",                   limit: 4
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "slug",                   limit: 191
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
  add_index "members", ["slug"], name: "index_members_on_slug", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "subject",    limit: 255
    t.text     "body",       limit: 65535
    t.integer  "topic_id",   limit: 4
    t.integer  "member_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "posts", ["member_id"], name: "index_posts_on_member_id", using: :btree
  add_index "posts", ["topic_id"], name: "index_posts_on_topic_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "member_id",         limit: 4
    t.string   "short_description", limit: 255
    t.string   "about",             limit: 255
    t.string   "facebook_link",     limit: 255
    t.string   "twitter_link",      limit: 255
    t.string   "linkedin_link",     limit: 255
    t.datetime "DOB"
    t.string   "country",           limit: 255
    t.string   "state",             limit: 255
    t.string   "city",              limit: 255
    t.string   "gender",            limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "profiles", ["member_id"], name: "index_profiles_on_member_id", using: :btree

  create_table "subscribers", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "member_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "topics", ["member_id"], name: "index_topics_on_member_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_foreign_key "comments", "communities"
  add_foreign_key "comments", "members"
  add_foreign_key "posts", "members"
  add_foreign_key "posts", "topics"
  add_foreign_key "profiles", "members"
  add_foreign_key "topics", "members"
end
