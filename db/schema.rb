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

ActiveRecord::Schema.define(:version => 20120402210105) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "events", :force => true do |t|
    t.text     "description"
    t.datetime "date"
    t.integer  "venue_id"
    t.string   "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.time     "time"
    t.string   "keywords"
    t.integer  "user_id"
    t.string   "who"
  end

  create_table "shortened_urls", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type", :limit => 20
    t.string   "url",                                     :null => false
    t.string   "unique_key", :limit => 10,                :null => false
    t.integer  "use_count",                :default => 0, :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "shortened_urls", ["owner_id", "owner_type"], :name => "index_shortened_urls_on_owner_id_and_owner_type"
  add_index "shortened_urls", ["unique_key"], :name => "index_shortened_urls_on_unique_key", :unique => true
  add_index "shortened_urls", ["url"], :name => "index_shortened_urls_on_url"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.integer  "postal_code"
    t.string   "town"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

end
