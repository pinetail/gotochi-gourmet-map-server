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

ActiveRecord::Schema.define(:version => 20110430140621) do

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "tel"
    t.string   "category"
    t.integer  "tabelog_id"
    t.string   "business_hours"
    t.string   "holiday"
    t.decimal  "latitude",           :precision => 17, :scale => 14, :default => 0.0
    t.decimal  "longitude",          :precision => 17, :scale => 14, :default => 0.0
    t.float    "score"
    t.string   "tabelog_url"
    t.string   "tabelog_mobile_url"
    t.string   "station"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "use_flg"
  end

end
