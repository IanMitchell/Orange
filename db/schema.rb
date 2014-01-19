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

ActiveRecord::Schema.define(version: 20140119191253) do

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",        default: 0
    t.integer  "user_id"
    t.integer  "buyer_id"
    t.integer  "created_by_id"
  end

  add_index "posts", ["buyer_id"], name: "index_posts_on_buyer_id"
  add_index "posts", ["created_by_id"], name: "index_posts_on_created_by_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "posts_tags", force: true do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "posts_tags", ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id", unique: true

  create_table "reviews", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.integer  "owner_id"
    t.string   "feedback"
    t.integer  "score",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["owner_id"], name: "index_reviews_on_owner_id"
  add_index "reviews", ["post_id"], name: "index_reviews_on_post_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "role",                   default: 0
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "website"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
