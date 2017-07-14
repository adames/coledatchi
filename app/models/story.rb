class Story < ApplicationRecord
  belongs_to :pet
  has_many :histories
  serialize :readable_history, Array





  def update_readable_history

    self.readable_history = []

    new_history = History.select do |event|
      event.story_id == self.id
    end
    new_history.sort_by {|event| event.event_time}.each do |story_item|
      self.readable_history << story_item
    end


  end




end
