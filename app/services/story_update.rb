
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
    @last_hour_updated = pet.updated_at.localtime.hour
    @time_passed = (Time.now.hour - @last_hour_updated).abs
    pet.happiness -= @time_passed
    pet.hygiene -= @time_passed / 2
    pet.hunger += @time_passed
    pet.save

  end

  def update_story_random
    #this method should update stories on a pet depending on time
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
    # pet.save
    pet.story.save

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
    # pet.save
    pet.story.save

  end

  def show_history
    pet.story.history.each do |event|
      puts event
    end

  end



end
