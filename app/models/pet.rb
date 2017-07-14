class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :species
  has_one :story
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
    when (-50..-10)
      self.hunger = -10
      "Your pet is EXTREMELY hungry, feed it!"
    when (-9..0)
      "Your pet is really hungry."
    when (1..10)
       "Your pet isn't hungry."
    when (11..20)
       "Your pet is full."
    when (21..50)
      if self.hunger > 30
        self.hunger = 30
        "Your pet is stuffed!"
      end
    end
  end

  def display_happiness
    case self.happiness
    when (-50..-10)
      self.happiness = -10
       "Your pet is EXTREMELY sad, cheer it up!"
    when (-9..0)
       "Your pet is really sad."
    when (1..10)
       "Your pet is mellow."
    when (11..20)
       "Your pet is happy!"
    when (21..50)
      if self.happiness > 30
        self.happiness = 30
      end
       "Your pet is living the life!"
    end
  end

  def display_hygiene
    case self.hygiene
    when (-50..-10)
      self.hygiene = -10
      "Your pet is EXTREMELY filthy, give it a bath!"
    when (-9..0)
      "Your pet is dirty."
    when (1..10)
      "Your pet is clean."
    when (11..20)
      "Your pet is sparkling!"
    when (21..50)
      if self.hygiene > 30
        self.hygiene = 30
      end
      "Your pet is shining!"
    end
  end

  def play
    self.happiness += 3
    self.story.history << "You played with your pet on #{Time.now.strftime("%A, %d on %I:%M%p")} "
    self.story.save
    self.save
  end

  def wash
    self.hygiene += 3
    self.story.history << "You groomed your pet on #{Time.now.strftime("%A, %d on %I:%M%p")} "
    self.story.save
    self.save
  end

  def feed
    self.hunger += 5
    self.story.history << "You fed your pet on #{Time.now.strftime("%A, %d on %I:%M%p")} "
    self.story.save
    self.save
  end

  def explore
    StoryUpdate.new(self).update_story_random
  end

  def fun
    StoryUpdate.new(self).update_story_personality
  end



end
