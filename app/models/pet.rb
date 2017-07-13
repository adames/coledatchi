class Pet < ApplicationRecord
  belongs_to :user
  has_one :story
  has_one :personality


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

  def display_hunger
    case self.hunger
    when self.hunger <= -10
      self.hunger = -10
      "Your pet is EXTREMELY hungry, feed it!"
    when (-9..0)
      "Your pet is really hungry."
    when (1..10)
       "Your pet isn't hungry."
    when (10..20)
       "Your pet is full."
    when self.hunger >20
      if self.hunger > 30
        self.hunger = 30
        "Your pet is stuffed!"
      end
    end
  end

  def display_happiness
    case self.happiness
    when self.happiness <= -10
      self.happiness = -10
       "Your pet is EXTREMELY sad, cheer it up!"
    when (-9..0)
       "Your pet is really sad."
    when (1..10)
       "Your pet is mellow."
    when (10..20)
       "Your pet is happy!"
    when self.happiness >20
      if self.happiness > 30
        self.happiness = 30
      end
       "Your pet is living the life!"
    end
  end

  def display_hygiene
    case self.hygiene
    when self.hygiene <= -10
      self.hygiene = -10
      "Your pet is EXTREMELY filthy, give it a bath!"
    when (-9..0)
      "Your pet is dirty."
    when (1..10)
      "Your pet is clean."
    when (10..20)
      "Your pet is sparkling!"
    when self.hygiene >20
      if self.hygiene > 30
        self.hygiene = 30
      end
      "Your pet is shining!"
    end
  end



end
