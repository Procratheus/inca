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

ActiveRecord::Schema.define(version: 20150825003621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", force: :cascade do |t|
    t.integer  "publisher_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "kortext_id"
    t.string   "e_isbn"
    t.string   "p_isbn"
    t.string   "type_name"
    t.string   "format"
    t.string   "title"
    t.string   "author"
    t.string   "language"
    t.integer  "pages"
    t.string   "description"
    t.string   "imprint"
    t.string   "pub_date"
    t.string   "price_gbp"
    t.string   "price_usd"
    t.string   "price_eur"
    t.string   "bic"
    t.string   "bisac"
    t.string   "content_image"
    t.string   "availability"
    t.string   "edition"
    t.string   "publisher_name"
    t.string   "vat"
  end

  add_index "contents", ["publisher_id"], name: "index_contents_on_publisher_id", using: :btree

  create_table "histories", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "object_name"
    t.string   "attribute_name"
    t.string   "before_value"
    t.string   "after_value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "object_id"
  end

  add_index "histories", ["user_id"], name: "index_histories_on_user_id", using: :btree

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "address"
    t.datetime "contract_start_date"
    t.datetime "contract_end_date"
  end

  add_index "publishers", ["name"], name: "index_publishers_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.string   "profile_image_id"
    t.integer  "role",                   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "contents", "publishers"
  add_foreign_key "histories", "users"
end
