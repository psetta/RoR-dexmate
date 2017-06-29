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

ActiveRecord::Schema.define(version: 20170609183629) do

  create_table "mod_calendars", primary_key: "idcalendar", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "date"
    t.integer "anualRep", limit: 1, default: 0
    t.string "category", limit: 45
    t.datetime "dateF"
    t.string "name", limit: 45, null: false
    t.string "web", limit: 50
    t.text "text", limit: 4294967295
    t.string "color", limit: 45, default: "bg-color-blue"
    t.integer "idUser_fk", null: false
    t.string "photo"
    t.index ["idUser_fk"], name: "fk_calendar_users_idx"
    t.index ["idcalendar"], name: "idcalendar_UNIQUE", unique: true
  end

  create_table "mod_healths", primary_key: "idmodHealth", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "weight", precision: 10
    t.integer "pressureHigh"
    t.string "pressureLow", limit: 45
    t.decimal "imc", precision: 4, scale: 2
    t.decimal "height", precision: 4, scale: 2, default: "1.7"
    t.date "date"
    t.integer "idUser_fk", null: false
    t.index ["idUser_fk"], name: "fk_mod_Health_users1_idx"
  end

  create_table "users", primary_key: "idUser", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 45, null: false
    t.string "mail", limit: 45, null: false
    t.integer "admin", limit: 1, default: 0, null: false
    t.string "phone", limit: 15, default: "+34000000"
    t.string "password_digest"
    t.decimal "defaultHeight", precision: 4, scale: 2
    t.string "avatar", default: "avatar-1.jpg"
    t.string "remember_digest"
    t.index ["idUser"], name: "idUser_UNIQUE", unique: true
    t.index ["name"], name: "name_UNIQUE", unique: true
  end

  add_foreign_key "mod_calendars", "users", column: "idUser_fk", primary_key: "idUser", name: "fk_calendar_users", on_delete: :cascade
  add_foreign_key "mod_healths", "users", column: "idUser_fk", primary_key: "idUser", name: "fk_mod_Health_users1", on_delete: :cascade
end
