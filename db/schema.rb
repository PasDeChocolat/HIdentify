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

ActiveRecord::Schema.define(version: 20140304054728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contribution_addresses", force: true do |t|
    t.decimal  "longitude",  precision: 15, scale: 10, default: 0.0
    t.decimal  "latitude",   precision: 15, scale: 10, default: 0.0
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contributions", force: true do |t|
    t.string   "inoutstate"
    t.integer  "aggregate"
    t.string   "range"
    t.string   "zip_code"
    t.string   "contributor_type"
    t.string   "candidate_name"
    t.string   "state"
    t.date     "date"
    t.string   "party"
    t.string   "reg_no"
    t.string   "city"
    t.integer  "amount"
    t.string   "non_monetary_yes_or_no"
    t.string   "district"
    t.string   "office"
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "county"
    t.string   "contributor_name"
    t.string   "election_period"
    t.string   "occupation"
    t.string   "non_monetary_description"
    t.string   "non_monetary_category"
    t.string   "employer"
    t.integer  "contribution_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributions", ["contribution_address_id"], name: "index_contributions_on_contribution_address_id", using: :btree

  create_table "groupings", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.string   "search_token"
    t.integer  "grouping_id"
    t.integer  "contribution_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["contribution_id"], name: "index_matches_on_contribution_id", using: :btree
  add_index "matches", ["grouping_id"], name: "index_matches_on_grouping_id", using: :btree

  create_table "votes", force: true do |t|
    t.string   "is_match"
    t.text     "comment"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["match_id"], name: "index_votes_on_match_id", using: :btree

end
