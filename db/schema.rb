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

ActiveRecord::Schema.define(version: 20160731160034) do

  create_table "clientes", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "adress",           limit: 255
    t.string   "neighborhood",     limit: 255
    t.string   "city",             limit: 255
    t.string   "state",            limit: 255
    t.string   "cep",              limit: 255
    t.string   "rg",               limit: 255
    t.string   "cpf",              limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "phone",            limit: 15
    t.string   "cel",              limit: 15
    t.string   "commercial_phone", limit: 15
    t.string   "another_cel",      limit: 15
    t.string   "email",            limit: 255
  end

  create_table "exams", force: :cascade do |t|
    t.binary   "data",        limit: 16777215, null: false
    t.string   "filename",    limit: 255
    t.text     "description", limit: 65535
    t.string   "mime_type",   limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "cliente_id",  limit: 4,        null: false
  end

  add_index "exams", ["cliente_id"], name: "fk_rails_ebc97852bd", using: :btree

  create_table "medicines", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "forn1",      limit: 255
    t.string   "forn2",      limit: 255
    t.string   "forn3",      limit: 255
    t.string   "forn4",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "specie",     limit: 255
    t.string   "race",       limit: 255
    t.string   "sex",        limit: 255
    t.string   "fur",        limit: 255
    t.date     "born_date"
    t.text     "obs",        limit: 65535
    t.integer  "cliente_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "anamnesis",  limit: 65535
    t.text     "historic",   limit: 65535
  end

  add_index "pets", ["cliente_id"], name: "index_pets_on_cliente_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "vaccines", force: :cascade do |t|
    t.boolean  "v10",                            limit: 1
    t.boolean  "raiva",                          limit: 1
    t.boolean  "giardia",                        limit: 1
    t.boolean  "pneumodog",                      limit: 1
    t.boolean  "triplice_felina",                limit: 1
    t.boolean  "triplice_felina_raiva",          limit: 1
    t.integer  "pet_id",                         limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "v10_1",                          limit: 1
    t.boolean  "v10_2",                          limit: 1
    t.boolean  "v10_3",                          limit: 1
    t.boolean  "v10_4",                          limit: 1
    t.boolean  "v7",                             limit: 1
    t.boolean  "triplice_felina_1",              limit: 1
    t.boolean  "triplice_felina_2",              limit: 1
    t.date     "v10_due_date"
    t.date     "v10_1_due_date"
    t.date     "v10_2_due_date"
    t.date     "v10_3_due_date"
    t.date     "v10_4_due_date"
    t.date     "raiva_due_date"
    t.date     "giardia_due_date"
    t.date     "pneumodog_due_date"
    t.date     "v7_due_date"
    t.date     "triplice_felina_due_date"
    t.date     "triplice_felina_raiva_due_date"
    t.date     "triplice_felina_1_due_date"
    t.date     "triplice_felina_2_due_date"
  end

  add_index "vaccines", ["pet_id"], name: "index_vaccines_on_pet_id", using: :btree

  add_foreign_key "exams", "clientes"
  add_foreign_key "pets", "clientes"
  add_foreign_key "vaccines", "pets"
end
