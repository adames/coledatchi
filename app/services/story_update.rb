
class StoryUpdate
  attr_accessor :pet, :story
  def initialize(pet)
    @pet = pet
    #params = pet object
  end

  def perform
    update_pet_only_from_time
    update_story_personality
    update_story_random
  end






  def update_pet_only_from_time
    #this should update a pet's hunger, happiness, etc... based on time passed since last updated
    @last_updated = self.pet.updated_at.localtime
    @minutes_passed = ((@last_updated - Time.now )/60).abs
    @hours_passed = @minutes_passed / 60
    self.pet.happiness -= @hours_passed
    self.pet.hygiene -= @hours_passed / 2
    self.pet.hunger += @hours_passed
    pet.save

  end

  def update_story_random
    #this method should update stories on a pet depending on time
    @ticks = @minutes_passed - 10
    while @ticks > 0
      @random_event = RandomEvent.find( 1 + rand(RandomEvent.all.size))
      puts "#{@random_event.description}"
      pet.story.history << "#{@random_event.description} on #{Time.now.strftime("%A, %d on %I:%M%p")}"
      unless @random_event.results[:happiness] == nil
         pet.happiness += @random_event.results[:happiness]
      end
      unless @random_event.results[:hygiene] == nil
        pet.hygiene += @random_event.results[:hygiene]
      end
      unless @random_event.results[:hunger] == nil
        pet.hunger += @random_event.results[:hunger]
      end
      pet.save
      pet.story.save
      @ticks -= (15 + rand(1..@ticks))
    end
  end

  def update_story_personality
    #this method should update stories on a pet depending on time
    @random_event = PersonalEvent.find( 1 + rand(PersonalEvent.all.size))
    puts "#{@random_event.description}"

    pet.story.history << "#{@random_event.description} on #{Time.now.strftime("%A, %d on %I:%M%p")}"
    unless @random_event.results[:happiness] == nil
       pet.happiness += @random_event.results[:happiness]
    end
    unless @random_event.results[:hygiene] == nil
      pet.hygiene += @random_event.results[:hygiene]
    end
    unless @random_event.results[:hunger] == nil
      pet.hunger += @random_event.results[:hunger]
    end
    pet.save
    pet.story.save

  end

  def show_history
    pet.story.history.each do |event|
      puts event
    end

  end



end
