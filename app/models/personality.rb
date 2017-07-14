class Personality < ApplicationRecord
  belongs_to :pet

  @@types = ['brave', 'curious', 'social']

  def self.types
    @@types
  end

  def self.generate_random(pet_object)
    # does not save
    new_personality = self.new
    new_personality.pet = pet_object
    new_personality.pet_type = self.types.sample
    new_personality
  end

  def self.set_personality(pet_type, pet_object)
    # does save
    new_personality = self.new
    new_personality.pet = pet_object
    new_personality.pet_type = pet_type
    new_personality.save
    new_personality
  end

end
