class Story < ApplicationRecord
  belongs_to :pet
  has_many :events


  def update_pet_only_from_time(pet)
    @last_updated = @pet.updated_at
    @time_passed = Time.now - @last_updated

  end


  def update_story
    #this method should update stories on a pet depending on time
  end


  def random_event(requirements)
    # given a set of requirements, it serves a random, appropriate event object.

  end

end
