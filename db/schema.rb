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

ActiveRecord::Schema.define(version: 20160314131835) do

  create_table "courses", force: :cascade do |t|
    t.string   "uid"
    t.boolean  "independent_study"
    t.string   "name"
    t.string   "code"
    t.float    "credits"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "courses", ["uid"], name: "index_courses_on_uid", unique: true

  create_table "courses_subjects", force: :cascade do |t|
    t.integer "course_id"
    t.integer "subject_id"
  end

  add_index "courses_subjects", ["course_id"], name: "index_courses_subjects_on_course_id"
  add_index "courses_subjects", ["subject_id"], name: "index_courses_subjects_on_subject_id"

  create_table "instructors", force: :cascade do |t|
    t.string   "middle"
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.string   "uid",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "instructors", ["uid"], name: "index_instructors_on_uid", unique: true

  create_table "segments", force: :cascade do |t|
    t.string   "uid",        null: false
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "segments", ["subject_id"], name: "index_segments_on_subject_id"
  add_index "segments", ["uid", "subject_id"], name: "index_segments_on_uid_and_subject_id", unique: true

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.string   "uid",          null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "subjects", ["uid"], name: "index_subjects_on_uid", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
