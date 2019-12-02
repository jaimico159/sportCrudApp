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

ActiveRecord::Schema.define(version: 2019_12_02_214136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "partners", force: :cascade do |t|
    t.string "code", null: false
    t.string "name"
    t.integer "record_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_partners_on_code"
  end

  create_table "registration_forms", force: :cascade do |t|
    t.integer "form_number", null: false
    t.bigint "partner_id"
    t.bigint "sport_type_id"
    t.integer "record_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_number"], name: "index_registration_forms_on_form_number"
    t.index ["partner_id"], name: "index_registration_forms_on_partner_id"
    t.index ["sport_type_id"], name: "index_registration_forms_on_sport_type_id"
  end

  create_table "sport_types", force: :cascade do |t|
    t.string "code", null: false
    t.string "name"
    t.integer "record_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_sport_types_on_code"
  end

  add_foreign_key "registration_forms", "partners"
  add_foreign_key "registration_forms", "sport_types"
end
