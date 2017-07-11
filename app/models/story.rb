class Story < ApplicationRecord
  belongs_to :pet
  has_many :events


  def update_pet_only_from_time
    #this should update a pet's hunger, happiness, etc... based on time passed since last updated
    @last_hour_updated = self.pet.updated_at.hour
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
    #placeholder for now

  end




end
