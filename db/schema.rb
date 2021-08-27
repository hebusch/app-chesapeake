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

ActiveRecord::Schema.define(version: 2021_08_26_195028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cajas", force: :cascade do |t|
    t.integer "private_id", null: false
    t.string "code", null: false
    t.float "weight", null: false
    t.bigint "corte_id"
    t.bigint "lote_id", null: false
    t.boolean "received", default: false
    t.boolean "manual", default: false
    t.index ["code"], name: "index_cajas_on_code", unique: true
    t.index ["corte_id"], name: "index_cajas_on_corte_id"
    t.index ["lote_id"], name: "index_cajas_on_lote_id"
  end

  create_table "cortes", force: :cascade do |t|
    t.integer "code", null: false
    t.string "description", null: false
    t.index ["code"], name: "index_cortes_on_code", unique: true
  end

  create_table "lotes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receptions", force: :cascade do |t|
    t.bigint "lote_id", null: false
    t.boolean "finished", default: false
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lote_id"], name: "index_receptions_on_lote_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cajas", "cortes"
  add_foreign_key "cajas", "lotes"
  add_foreign_key "receptions", "lotes"
end
