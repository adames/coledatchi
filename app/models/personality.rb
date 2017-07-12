class Personality < ApplicationRecord
  belongs_to :pet

  @@types = ['brave', 'curious', 'social']

  def self.types
    @@types
  end

  def self.set_personality(pet_type, pet_object)
    new_personality = self.new
    new_personality.pet = pet_object
    new_personality.pet_type = pet_type
    new_personality.save
    new_personality
  end

  # types I'm thinking so far = ['brave', 'curious', 'social']
end
