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

ActiveRecord::Schema.define(version: 20140217155328) do

  create_table "item_nums", force: true do |t|
    t.integer  "num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m_dimensions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "m_dimensions", ["name"], name: "index_m_dimensions_on_name", unique: true, using: :btree

  create_table "m_formats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "m_formats", ["name"], name: "index_m_formats_on_name", unique: true, using: :btree

  create_table "m_layouts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "m_layouts", ["name"], name: "index_m_layouts_on_name", unique: true, using: :btree

  create_table "m_materials", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "m_materials", ["name"], name: "index_m_materials_on_name", unique: true, using: :btree

  create_table "m_ordinary_channels", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "url"
    t.integer  "state_id"
    t.integer  "publisher_id"
    t.integer  "tag_ids",          default: [], array: true
    t.integer  "created_user_id"
    t.integer  "modified_user_id"
  end

  add_index "m_ordinary_channels", ["name"], name: "index_m_ordinary_channels_on_name", unique: true, using: :btree
  add_index "m_ordinary_channels", ["publisher_id"], name: "index_m_ordinary_channels_on_publisher_id", using: :btree

  create_table "m_ordinary_positions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "state_id"
    t.integer  "tag_ids",          default: [], array: true
    t.integer  "publisher_id"
    t.integer  "channel_id"
    t.integer  "material_id"
    t.integer  "type_id"
    t.integer  "dimension_id"
    t.integer  "layout_id"
    t.integer  "format_id"
    t.string   "size"
    t.integer  "created_user_id"
    t.integer  "modified_user_id"
  end

  add_index "m_ordinary_positions", ["channel_id"], name: "index_m_ordinary_positions_on_channel_id", using: :btree
  add_index "m_ordinary_positions", ["name"], name: "index_m_ordinary_positions_on_name", using: :btree
  add_index "m_ordinary_positions", ["publisher_id"], name: "index_m_ordinary_positions_on_publisher_id", using: :btree

  create_table "m_ordinary_publishers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "url"
    t.integer  "state_id"
    t.integer  "tag_ids",          default: [], array: true
    t.integer  "created_user_id"
    t.integer  "modified_user_id"
  end

  add_index "m_ordinary_publishers", ["name"], name: "index_m_ordinary_publishers_on_name", unique: true, using: :btree

  create_table "m_states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "m_types", ["name"], name: "index_m_types_on_name", unique: true, using: :btree

  create_table "per_pages", force: true do |t|
    t.integer  "per_page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
