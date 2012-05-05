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

ActiveRecord::Schema.define(:version => 20120505190922) do

  create_table "artwork_images", :force => true do |t|
    t.integer  "artwork_id"
    t.string   "description"
    t.string   "image_url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "artwork_images", ["artwork_id"], :name => "index_artwork_images_on_artwork_id"

  create_table "artworks", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.decimal  "price",      :precision => 8, :scale => 2, :default => 0.0
    t.string   "medium"
    t.string   "info"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  add_index "artworks", ["user_id"], :name => "index_artworks_on_user_id"

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.decimal  "subtotal",        :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "total",           :precision => 8, :scale => 2, :default => 0.0
    t.string   "delivary_method"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "school"
    t.string   "major"
    t.string   "bio"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
