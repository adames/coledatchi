class Pet < ApplicationRecord
  belongs_to :user
  has_one :story
  has_one :personality

  # def initialize(user)
  #   @user = user
  #   @story = Story.new
  #   @story.pet(@user) = self
  #   byebug
  #   @story.save
  #   self.save
  #
  # end

  def new_story
    @story = Story.new
    @story.pet = self
    @story.save

  end

  def self.generate_random
    new_pet = self.new
    new_pet.personality = Personality.generate_random(new_pet)
    new_pet


  end

end
