# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../config/environments/development.rb'

users = []
10.times do |i|
  users << User.create(name: Faker::HarryPotter.character, email: "admin#{i}", password_digest: BCrypt::Password.create('default'))
end

species = []
s_types = ['cat','dog','rock']
10.times do |i|
  species << Species.create(name: s_types[i % 3])
end

pets = []
10.times do |i|
  pets << Pet.create(name: Faker::Pokemon.name, user_id: users[i].id, species_id: species[i].id)
end

stories = []
10.times do |i|
  stories << Story.create(pet_id: pets[i].id)
end

p_types = ['brave', 'curious', 'social']

10.times do |i|
  Personality.create(pet_type: p_types[i % 3], pet_id: pets[i].id)
end


# New Event's should be in PAST tense

RandomEvent.create(name: "Walk your pet", description: "You walked your pet", "results" => {happiness: 1, hunger: 1})
RandomEvent.create(name: "Wash your pet", description: "You gave your pet a bath", "results" => {hygiene: 5})
RandomEvent.create(name: "Feed your pet", description: "You fed your pet", "results" => {hunger: -5})
RandomEvent.create(name: "Volcanoe", description: "A volcanoe exploded nearby.  It scared your pet.  Your pet also became strangely hungry", "results" => {happiness: -4, hunger: 1})
RandomEvent.create(name: "Mugged", description: "Your pet got ambushed by a roaving band of rogue pets.  It got mugged", "results" => {happiness: -7, hygiene: -3})
RandomEvent.create(name: "Mugged but not", description: "Your pet got ambushed by a roaving band of rogue pets.  They try to mug your pet but they get mugged themselves", "results" => {happiness: 7, hygiene: -3})
RandomEvent.create(name: "Top Chef", description: "Your pet watched an episode of Top Chef", "results" => {happiness: 5, hunger: -3})
RandomEvent.create(name: "Haircut", description: "Your pet got a haircut", "results" => {happiness: 4})
RandomEvent.create(name: "Hotdate", description: "Your pet has a hot date planned", "results" => {happiness: 8})
RandomEvent.create(name: "Play", description: "You rubbed your pet's belly", "results" => {happiness: 3})
RandomEvent.create(name: "Sick", description: "You pet fell sick for a bit but is better now", "results" => {happiness: -5})


PersonalEvent.create(name: "Brave", description: "Your pet slept without a night light", pet_type: p_types[0], "results" => {happiness: 1})
PersonalEvent.create(name: "Brave", description: "Your pet went skydiving", pet_type: p_types[0], "results" => {happiness: 2})
PersonalEvent.create(name: "Brave", description: "Your pet rode a bike without a helmet", pet_type:p_types[0], "results" => {happiness: 1})
PersonalEvent.create(name: "Brave", description: "Your pet went spelunking", pet_type: p_types[0], "results" => {happiness: 3, hygiene: -10})
PersonalEvent.create(name: "Brave", description: "Your pet played russian roulette", pet_type: p_types[0], "results" => {happiness: 3})
PersonalEvent.create(name: "Curious", description: "Your pet explored a cave", pet_type: p_types[1], "results" => {hygiene: -5, happiness: 5})
PersonalEvent.create(name: "Curious", description: "Your pet cooked meth", pet_type: p_types[1], "results" => {hygiene: -5, happiness: -2})
PersonalEvent.create(name: "Curious", description: "Your pet explored an abandoned tomb", pet_type: p_types[1], "results" => {hygiene: -3, happiness: 6})
PersonalEvent.create(name: "Curious", description: "Your pet discovered ancient ruins", pet_type:p_types[1], "results" => {hygiene: -3, happiness: 6})
PersonalEvent.create(name: "Curious", description: "Your pet poked a dead rodent", pet_type: p_types[1], "results" => {hygiene: -6, happiness: 3})
PersonalEvent.create(name: "Social", description: "Your pet gave a leadership presentation", pet_type: p_types[2], "results" => {happiness: 3})
PersonalEvent.create(name: "Social", description: "Your pet helped a fellow pet through a divorce", pet_type: p_types[2], "results" => {happiness: 2})
PersonalEvent.create(name: "Social", description: "Your pet cheered for a friend", pet_type: p_types[2], "results" => {happiness: 1})
PersonalEvent.create(name: "Social", description: "Your pet went clubbing", pet_type: p_types[2], "results" => {happiness: 4, hunger: -4})
PersonalEvent.create(name: "Social", description: "Your pet met a friend", pet_type: p_types[2], "results" => {happiness: 1})
