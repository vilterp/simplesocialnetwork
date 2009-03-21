# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090321020413) do

  create_table "comments", :force => true do |t|
    t.integer  "commenter_id"
    t.integer  "item_id"
    t.integer  "item_type"
    t.text     "body"
    t.datetime "created_at"
  end

  create_table "conversations", :force => true do |t|
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations_people", :force => true do |t|
    t.integer "conversation_id"
    t.integer "person_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "person_id"
    t.integer  "friend_id"
    t.integer  "messages"
    t.integer  "wall_posts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "conversation_id"
    t.text     "body"
    t.datetime "created_at"
    t.integer  "recipient_id"
    t.boolean  "unread",          :default => true
  end

  create_table "people", :force => true do |t|
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "status"
  end

  create_table "wall_posts", :force => true do |t|
    t.integer  "poster_id"
    t.integer  "postee_id"
    t.text     "body"
    t.datetime "created_at"
  end

end
