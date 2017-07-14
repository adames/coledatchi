class Species < ApplicationRecord
  has_many :pets

  @@types = ['cat','dog','rock']

  def self.types
    @@types
  end

  # returns image path based on type
  def self.generate_picture(type)
    photo_path = Dir[ "app/assets/images/#{type.pluralize}/*.jpg" ].sample
    photo_path.slice! "app/assets/images/"
    photo_path
  end

  def self.generate_random
    new_species = self.new
    new_species.name = self.types.sample
    new_species
  end

  def self.set_species(type)
    new_species = self.new
    new_species.name = type
    new_species.save
    new_species
  end
end
