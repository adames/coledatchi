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

ActiveRecord::Schema.define(version: 20170714154026) do

  create_table "histories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "event_time"
    t.integer "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_histories_on_story_id"
  end

  create_table "personal_events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "pet_type"
    t.string "results"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personalities", force: :cascade do |t|
    t.string "pet_type"
    t.integer "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_personalities_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "happiness", default: 10
    t.integer "hygiene", default: 10
    t.integer "hunger", default: 0
    t.integer "user_id"
    t.integer "species_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["species_id"], name: "index_pets_on_species_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "random_events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "results"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories", force: :cascade do |t|
    t.string "readable_history"
    t.integer "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_stories_on_pet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
