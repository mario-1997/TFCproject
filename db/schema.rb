# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_01_075633) do

  create_table "albums", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "musical_style"
    t.date "publication_date"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_albums_on_group_id"
  end

  create_table "concerts", charset: "utf8mb3", force: :cascade do |t|
    t.string "place"
    t.date "concert_date"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_concerts_on_group_id"
  end

  create_table "groups", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "musical_style"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "ocupation"
    t.string "dni"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_members_on_group_id"
  end

  create_table "songs", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.date "publication_date"
    t.bigint "album_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

  add_foreign_key "albums", "groups"
  add_foreign_key "concerts", "groups"
  add_foreign_key "members", "groups"
  add_foreign_key "songs", "albums"
end
