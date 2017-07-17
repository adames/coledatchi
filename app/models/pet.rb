class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :species
  has_one :story
  has_many :histories, through: :story
  has_one :personality

  def new_story
    @story = Story.new
    @story.pet = self
  end

  def self.generate_random
    random_pet = Pet.new(name: Faker::Pokemon.name)
    random_pet.personality = Personality.generate_random(random_pet)
    random_pet.species = Species.generate_random
    random_pet.picture = Species.generate_picture(random_pet.species.name)
    random_pet.new_story
    random_pet
  end

  def display_hunger
    case self.hunger
    when (-500..-10)
      self.hunger = -10
      self.save
      "Your pet is EXTREMELY hungry, feed it!"
    when (-9..0)
      "Your pet is really hungry."
    when (1..10)
       "Your pet isn't hungry."
    when (11..20)
       "Your pet is full."
    when (21..500)
      if self.hunger > 30
        self.hunger = 30
        self.save
      end
      "Your pet is stuffed!"
    end
  end

  def display_happiness
    case self.happiness
    when (-500..-10)
      self.happiness = -10
      self.save
       "Your pet is EXTREMELY sad, cheer it up!"
    when (-9..0)
       "Your pet is really sad."
    when (1..10)
       "Your pet is mellow."
    when (11..20)
       "Your pet is happy!"
    when (21..500)
      if self.happiness > 30
        self.happiness = 30
        self.save
      end
       "Your pet is living the life!"
    end
  end

  def display_hygiene
    case self.hygiene
    when (-500..-10)
      self.hygiene = -10
      self.save
      "Your pet is EXTREMELY filthy, give it a bath!"
    when (-9..0)
      "Your pet is dirty."
    when (1..10)
      "Your pet is clean."
    when (11..20)
      "Your pet is sparkling!"
    when (21..500)
      if self.hygiene > 30
        self.hygiene = 30
        self.save
      end
      "Your pet is shining!"
    end
  end

  def play
    StoryUpdate.new(self).update_play
  end

  def wash
    StoryUpdate.new(self).update_wash
  end

  def feed
    StoryUpdate.new(self).update_feed
  end

  def explore
    StoryUpdate.new(self).manual_random_event
  end

  def fun
    StoryUpdate.new(self).update_story_personality
  end



end
