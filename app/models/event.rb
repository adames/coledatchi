class Event < ApplicationRecord
  belongs_to :story

  name, description, results, requirements
  #I'd like to add requirements
  @@all_events = [bathed_in_fountain, new_friend, tripped_and_fell]

  def self.random_event
    self.new.send(rand(@@all_events)) # This creates a new event with attributes.
  end

  def bathed_in_fountain
    @name = "Bathed in the fountain"
    @description = "decided to take a nice, cold wash in the fountain"
    @results = {hygiene: 2, happiness: 1}
  end

  def new_friend
    @name = "Made a new friend"
    @description = "met a new friend"
    @results = {happiness: 2}
  end

  def tripped_and_fell
    @name = "Tripped and fell"
    @description = "was going for a walk and tripped on something. They hurt themself and got dirty."
    @results = {happiness: -3, hygiene: -2}
  end

end
