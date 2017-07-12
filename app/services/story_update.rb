
class StoryUpdate
  attr_accessor :pet
  def initialize(pet)
    @pet = pet
    #params = pet object
  end

  def update_story
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
    # self.happiness += @random_event.results[:happiness]
    # self.hygiene += @random_event.results[:hygiene]
    # self.hunger += @random_event.results[:hunger]
    pet.save
    pet.story.save
    #placeholder for now

  end

end
