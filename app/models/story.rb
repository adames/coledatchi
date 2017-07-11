class Story < ApplicationRecord
  belongs_to :pet
  serialize :history, Array



  def update_pet_only_from_time
    #this should update a pet's hunger, happiness, etc... based on time passed since last updated
    @last_hour_updated = self.pet.updated_at.localtime.hour
    @time_passed = (Time.now.hour - @last_hour_updated).abs
    self.pet.happiness -= @time_passed
    self.pet.hygiene -= @time_passed / 2
    self.pet.hunger += @time_passed
    self.pet.save

  end


  def update_story
    #this method should update stories on a pet depending on time
    @random_event = Event.find( 1 + rand(Event.all.size))
    puts "#{@random_event.description}"
    self.history << "#{@random_event.description} on #{Time.now}"
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
