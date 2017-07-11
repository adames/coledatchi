# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../config/environments/development.rb'

users = []
10.times do
  users << User.create(name: Faker::HarryPotter.character)
end

pets = []
10.times do |i|
  pets << Pet.create(name: Faker::Pokemon.name, user_id: users[i].id)
end


# Event.create()
Event.create(name: "Walk your pet", description: "You walked your pet", "results" => {happiness: 1, hunger: 1})
Event.create(name: "Wash your pet", description: "You gave your pet a bath", "results" => {hygiene: 5})
Event.create(name: "Feed your pet", description: "You fed your pet", "results" => {hunger: -5})


  # create_table "events", force: :cascade do |t|
  #   t.string "name"
  #   t.string "description"
  #   t.string "results"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end
  #
  # create_table "pets", force: :cascade do |t|
  #   t.string "name"
  #   t.integer "happiness", default: 10
  #   t.integer "hygiene", default: 10
  #   t.integer "hunger", default: 0
  #   t.integer "user_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end
  #
  # create_table "stories", force: :cascade do |t|
  #   t.string "history"
  #   t.integer "pet_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end
  #
  # create_table "users", force: :cascade do |t|
  #   t.string "username"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end
