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

ActiveRecord::Schema.define(version: 20171122102930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.integer  "year"
    t.string   "month"
    t.integer  "date"
    t.string   "payment_mode"
    t.integer  "tuition_fee"
    t.integer  "library_fund"
    t.integer  "computer_fee"
    t.integer  "science_lab_fee"
    t.integer  "video_music_fee"
    t.integer  "sports_fund"
    t.integer  "workbook_charges"
    t.integer  "AC_charges"
    t.integer  "generator_charges"
    t.integer  "fine"
    t.integer  "previous_books"
    t.integer  "annual_fund"
    t.integer  "total"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "payments", ["section_id"], name: "index_payments_on_section_id", using: :btree
  add_index "payments", ["student_id"], name: "index_payments_on_student_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",             null: false
    t.integer  "section_id"
    t.string   "admission_number", null: false
    t.integer  "tuition_fee"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "students", ["admission_number"], name: "index_students_on_admission_number", unique: true, using: :btree
  add_index "students", ["section_id"], name: "index_students_on_section_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "variables", force: :cascade do |t|
    t.integer  "year",         null: false
    t.string   "month",        null: false
    t.integer  "date",         null: false
    t.string   "payment_mode", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "payments", "sections"
  add_foreign_key "payments", "students"
  add_foreign_key "students", "sections"
end
