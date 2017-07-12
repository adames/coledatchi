class StoryUpdate

  def initialize(params)
    
    #params = pet object
  end

  def update_story
    #this method should update stories on a pet depending on time
    @random_event = RandomEvent.find( 1 + rand(RandomEvent.all.size))
    puts "#{@random_event.description}"
    params.story.history << "#{@random_event.description} on #{Time.now.strftime("%A, %d on %I:%M%p")}"
    unless @random_event.results[:happiness] == nil
       params.happiness += @random_event.results[:happiness]
    end
    unless @random_event.results[:hygiene] == nil
      params.hygiene += @random_event.results[:hygiene]
    end
    unless @random_event.results[:hunger] == nil
      params.hunger += @random_event.results[:hunger]
    end
    # self.happiness += @random_event.results[:happiness]
    # self.hygiene += @random_event.results[:hygiene]
    # self.hunger += @random_event.results[:hunger]
    params.save
    params.story.save
    #placeholder for now

  end

end
