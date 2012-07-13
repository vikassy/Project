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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120713054526) do

  create_table "calenders", :force => true do |t|
    t.integer  "user_id"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "title"
    t.text     "description"
    t.text     "personal_comment"
  end

  add_index "calenders", ["start_time"], :name => "index_calenders_on_start_time"
  add_index "calenders", ["user_id"], :name => "index_calenders_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "type"
    t.text     "admins_id"
    t.text     "venue"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "friendships", :force => true do |t|
    t.boolean  "confirm"
    t.boolean  "sent_req"
    t.integer  "user_id"
    t.integer  "viewer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friendships", ["confirm"], :name => "index_friendships_on_confirm"
  add_index "friendships", ["sent_req"], :name => "index_friendships_on_sent_req"
  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"
  add_index "friendships", ["viewer_id"], :name => "index_friendships_on_viewer_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "avail"
    t.text     "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "gavatar"
    t.text     "invitation"
    t.text     "accepted"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "avatar"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
