
class StoryUpdate
  attr_accessor :pet, :story, :minutes_passed
  def initialize(pet)
    @pet = pet
    #params = pet object
  end

  def perform
    update_pet_only_from_time
    update_story_personality
    # update_readable_history
    # update_story_random
  end


  def update_pet_only_from_time
    #this should update a pet's hunger, happiness, etc... based on time passed since last updated
    # byebug
    @last_updated = pet.updated_at.localtime
    @minutes_passed = ((@last_updated - Time.now )/60).abs
    @hours_passed = @minutes_passed / 60
    pet.happiness -= @hours_passed
    pet.hygiene -= @hours_passed / 2
    pet.hunger += @hours_passed

    update_story_random(@minutes_passed, @last_updated)

    pet.save
    pet.story.save

  end

  def update_story_random(minutes, last_updated)
    #this method should update stories on a pet depending on time

    @ticks = (minutes * 60) - 120 #makes a random_event a minimum of 2 minutes before activating
    backwards_history = []
    while @ticks > 0
      @random_event = RandomEvent.find( 1 + rand(RandomEvent.all.size))
      puts "#{@random_event.description}"
      last_updated -= @ticks
      h = History.new(name: @random_event.name, description: @random_event.description, event_time: Time.now, results: @random_event.results)
      h.story = pet.story
      h.save
      # backwards_history << "#{@random_event.description} on #{last_updated.strftime("%A, %d on %I:%M%p")}"#{Time.now.strftime("%A, %d on %I:%M%p")}
      unless @random_event.results[:happiness] == nil
         pet.happiness += @random_event.results[:happiness]
      end
      unless @random_event.results[:hygiene] == nil
        pet.hygiene += @random_event.results[:hygiene]
      end
      unless @random_event.results[:hunger] == nil
        pet.hunger += @random_event.results[:hunger]
      end
      @ticks -= (300 + rand(1..@ticks))
    end


    pet.save
    pet.story.save

  end

  def update_story_personality
    #this method should update stories on a pet depending on time
    @random_event = PersonalEvent.find( 1 + rand(PersonalEvent.all.size))
    puts "#{@random_event.description}"

    h = History.new(name: @random_event.name, description: @random_event.description, event_time: Time.now, results: @random_event.results)
    h.story = pet.story
    h.save

    # pet.story.readable_history << "#{@random_event.description} on #{Time.now.strftime("%A, %d on %I:%M%p")}"
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


  def update_play
    pet.happiness += 3
    h = History.new(name: "Play", description: "You played with your pet", event_time: Time.now, "results" => {happiness: 3})
    h.story = pet.story
    h.save
    pet.save
  end

  def update_wash
    pet.hygiene += 3
    h = History.new(name: "Wash", description: "You washed your pet", event_time: Time.now, "results" => {hygiene: 3})
    h.story = pet.story
    h.save
    pet.save
  end

  def update_feed
    pet.hunger += 5
    h = History.new(name: "Feed", description: "You fed your pet", event_time: Time.now, "results" => {hunger: 5})
    h.story = pet.story
    h.save
    pet.save
  end






end
