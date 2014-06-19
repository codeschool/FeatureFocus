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

ActiveRecord::Schema.define(version: 20140619151347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "deals", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vendor_id"
    t.integer  "price_in_cents"
    t.datetime "ends_at"
  end

  add_index "deals", ["vendor_id"], :name => "index_deals_on_vendor_id"

  create_table "referrals", force: true do |t|
    t.integer  "deal_id"
    t.integer  "referrer_id"
    t.string   "referee_email"
    t.text     "token"
    t.datetime "consumed_at"
    t.datetime "collected_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "referrals", ["deal_id"], :name => "index_referrals_on_deal_id"
  add_index "referrals", ["referrer_id"], :name => "index_referrals_on_referrer_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "address"
    t.spatial  "latlon",     limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.spatial  "latlon",     limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.string   "category"
  end

end
