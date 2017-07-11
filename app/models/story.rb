class Story < ApplicationRecord
  belongs_to :pet
  has_many :events

  def update_story
    #this method should update stories on a pet depending on time
  end

  def random_event(requirements)
    # given a set of requirements, it serves a random, appropriate event object.
    
  end

end
