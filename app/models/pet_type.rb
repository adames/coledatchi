# == Schema Information
#
# Table name: pet_types
#
#  id        :integer          not null, primary key
#  species   :string
#  greeting  :string
#  farewell  :string
#  happiness :string
#  sadness   :string
#  anger     :string
#

class PetType < ApplicationRecord
  has_many :pets

  def initialize(species_name)
    self.send(species_name) # species name must correspond with existing method
  end

  def self.new_random
    types = ['dog','cat','bird']
    PetType.new(types[rand(types.length) # Picks random item in types
  end

  def dog
    @species = 'dog'
    @greeting = "smells your butt"
    @farewell = "bark"
    @happiness = "wags its tail"
    @sadness = "whimper"
    @anger = "growl"
  end

  def cat
    @species = 'cat'
    @greeting = "meow"
    @farewell = "meow"
    @happiness = "purr"
    @sadness = "*ignores you*"
    @anger = "hiss"
  end

  def bird
    @species = 'bird'
    @greeting = "tweet"
    @farewell = "tweet"
    @happiness = "sing"
    @sadness = "caw"
    @anger = "squack"
  end

end
