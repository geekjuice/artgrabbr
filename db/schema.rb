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

ActiveRecord::Schema.define(:version => 20121108032010) do

  create_table "artwork_images", :force => true do |t|
    t.integer  "artwork_id"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "showcaseimage"
  end

  add_index "artwork_images", ["artwork_id"], :name => "index_artwork_images_on_artwork_id"

  create_table "artworks", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.string   "title",                         :null => false
    t.integer  "price",      :default => 0
    t.string   "medium"
    t.text     "info"
    t.boolean  "sold",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "size"
  end

  add_index "artworks", ["user_id"], :name => "index_artworks_on_user_id"

  create_table "buyers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "inquirycount"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "remember_token"
    t.string   "password_digest"
    t.string   "name"
    t.boolean  "validated",              :default => false
    t.string   "validation_code"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "buyers", ["remember_token"], :name => "index_buyers_on_remember_token"

  create_table "mailing_lists", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "artwork_id",                                                         :null => false
    t.string   "name",                                                               :null => false
    t.string   "email",                                                              :null => false
    t.decimal  "total",               :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
    t.string   "stripe_charge_token"
    t.text     "inquirymessage"
    t.integer  "buyer_id"
    t.string   "address"
    t.string   "status"
    t.integer  "requested_price"
  end

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "school"
    t.string   "major"
    t.string   "bio"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "avatar"
    t.string   "name"
    t.string   "last_name",       :null => false
    t.string   "first_name",      :null => false
    t.float    "longitude"
    t.float    "latitude"
    t.string   "pickup_location"
  end

end
