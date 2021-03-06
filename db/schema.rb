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

ActiveRecord::Schema.define(:version => 20151221042249) do

  create_table "banners", :force => true do |t|
    t.string   "image"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "business_profiles", :force => true do |t|
    t.text     "name",       :limit => 255, :default => "Company"
    t.text     "image",      :limit => 255, :default => "url/image.png"
    t.text     "address",    :limit => 255, :default => "address"
    t.text     "url",        :limit => 255, :default => "url"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.boolean  "root"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "category_trees", :force => true do |t|
    t.integer  "root_id"
    t.integer  "subone_id"
    t.integer  "subtwo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chats", :force => true do |t|
    t.integer  "first_id"
    t.integer  "second_id"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "quantity",   :default => 1
    t.integer  "order_id"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "customer_id"
    t.integer  "cart_id"
    t.decimal  "total"
  end

  create_table "private_profiles", :force => true do |t|
    t.text     "name",       :limit => 255, :default => "Name"
    t.text     "image",      :limit => 255, :default => "url/image.png"
    t.text     "address",    :limit => 255, :default => "address"
    t.integer  "age",                       :default => 0
    t.text     "gender",     :limit => 255, :default => "unknown"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price",       :precision => 8, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "owner_id"
    t.integer  "category_id"
  end

  create_table "requests", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "private"
    t.boolean  "business"
    t.date     "request_date"
    t.string   "payment_details"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "accepted"
    t.boolean  "viewed"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.boolean  "admin"
    t.boolean  "private"
    t.boolean  "business"
    t.integer  "count",                                 :default => 0
    t.integer  "private_id"
    t.integer  "business_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
