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

ActiveRecord::Schema.define(version: 20131104043451) do

  create_table "mst_cards", force: true do |t|
    t.string   "card_name"
    t.string   "mana"
    t.string   "card_type"
    t.string   "poto"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_cards", force: true do |t|
    t.integer  "user_id",       default: 0, null: false
    t.integer  "card_id",       default: 0, null: false
    t.integer  "card_group_no", default: 0, null: false
    t.integer  "count",         default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_cards", ["user_id", "card_group_no"], name: "IDX_User_Cards_2", using: :btree
  add_index "user_cards", ["user_id", "card_id"], name: "IDX_User_Cards_1", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
