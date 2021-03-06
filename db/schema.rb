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

ActiveRecord::Schema.define(:version => 20130417204053) do

  create_table "planet_names", :force => true do |t|
    t.string   "name"
    t.text     "explanation"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "vote_count",  :default => 0
    t.integer  "planet_id"
  end

  add_index "planet_names", ["status"], :name => "index_planet_names_on_status"
  add_index "planet_names", ["user_id"], :name => "index_planet_names_on_user_id"

  create_table "planets", :force => true do |t|
    t.string   "host_name"
    t.string   "planet_letter"
    t.string   "discovery_method"
    t.string   "orbital_period"
    t.string   "planet_mass"
    t.string   "planet_radius"
    t.string   "ra"
    t.string   "dec"
    t.string   "hd_host_name"
    t.string   "status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "planets", ["status"], :name => "index_planets_on_status"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.text     "extra"
    t.string   "picture"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "planet_name_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "votes", ["planet_name_id"], :name => "index_votes_on_planet_name_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
