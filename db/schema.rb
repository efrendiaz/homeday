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

ActiveRecord::Schema.define(version: 2018_10_29_143637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "properties", force: :cascade do |t|
    t.string "offer_type"
    t.string "property_type"
    t.string "zip_code"
    t.string "city"
    t.string "street"
    t.string "house_number"
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.integer "construction_year"
    t.decimal "number_of_rooms"
    t.string "currency"
    t.decimal "price"
    t.decimal "lat", precision: 19, scale: 8
    t.decimal "lng", precision: 19, scale: 8
    t.index ["location"], name: "index_properties_on_location", using: :gist
  end

end
