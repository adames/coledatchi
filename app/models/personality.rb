class Personality < ApplicationRecord
  belongs_to :pet

  @@types = ['brave', 'curious', 'social']

  def self.generate_random(pet_obj)
    self.new(pet_type: @@types.sample, pet_id: pet_obj.id)
  end

  # types I'm thinking so far = ['brave', 'curious', 'social']
end
