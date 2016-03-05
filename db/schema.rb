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

ActiveRecord::Schema.define(version: 20161203113000) do


  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.string   "right_sig_url"
    t.string   "mkt_place_url"
    t.string   "usertype"
  end

  create_table "advisor_users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "school_name"
    t.string   "school_level"
    t.string   "pay_code"
    t.string   "team_name"
    t.string   "team_code"
    t.string   "usertype"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_users", force: :cascade do |t|
    t.string   "school_level"
    t.string   "school_name"
    t.string   "team_name"
    t.string   "pay_code"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "team_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
    t.string   "pay_status"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "school_level"
    t.string   "school_name"
    t.string   "team_name"
    t.string   "pay_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string  "team_name"
    t.string  "team_code"
    t.integer "advisor_users_id"
  end
  
end
