class Story < ApplicationRecord
  belongs_to :pet
  serialize :history, Array

  #story will call a run file from Services and create events based on LivingEvents, PersonalityEvents, and RandomEvents


  def update_pet_only_from_time
    #this should update a pet's hunger, happiness, etc... based on time passed since last updated
    @last_updated = self.pet.updated_at.localtime
    @minutes_passed = ((Time.now.hour - @last_updated) / 60).abs
    @hours_passed = @minutes_passed / 60
    self.pet.happiness -= @hours_passed
    self.pet.hygiene -= @hours_passed / 2
    self.pet.hunger += @hours_passed
    self.pet.save
    # TODO move this to services, make a LivingEvents database

  end


  def update_story
    #this method should update stories on a pet depending on time
    @random_event = RandomEvent.find( 1 + rand(RandomEvent.all.size))
    puts "#{@random_event.description}"
    self.history << "#{@random_event.description} on #{Time.now.strftime("%A, %d on %I:%M%p")}"
    unless @random_event.results[:happiness] == nil
       self.pet.happiness += @random_event.results[:happiness]
    end
    unless @random_event.results[:hygiene] == nil
      self.pet.hygiene += @random_event.results[:hygiene]
    end
    unless @random_event.results[:hunger] == nil
      self.pet.hunger += @random_event.results[:hunger]
    end
    # self.happiness += @random_event.results[:happiness]
    # self.hygiene += @random_event.results[:hygiene]
    # self.hunger += @random_event.results[:hunger]
    self.pet.save
    self.save
    #placeholder for now

  end

  def update_story_for_personality
    #this method should update stories on a pet depending on time
    @random_event = PersonalEvent.find( 1 + rand(PersonalEvent.all.size))
    puts "#{@random_event.description}"
    self.history << "#{@random_event.description} on #{Time.now.strftime("%A, %d on %I:%M%p")}"
    unless @random_event.results[:happiness] == nil
       self.pet.happiness += @random_event.results[:happiness]
    end
    unless @random_event.results[:hygiene] == nil
      self.pet.hygiene += @random_event.results[:hygiene]
    end
    unless @random_event.results[:hunger] == nil
      self.pet.hunger += @random_event.results[:hunger]
    end
    # self.happiness += @random_event.results[:happiness]
    # self.hygiene += @random_event.results[:hygiene]
    # self.hunger += @random_event.results[:hunger]
    self.pet.save
    self.save
    #placeholder for now

  end

  def show_history
    self.history.each do |event|
      puts event
    end

  end




end
