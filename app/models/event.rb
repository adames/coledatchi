# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :string
#  pet_health     :integer
#  pet_hunger     :integer
#  pet_boredom    :integer
#  pet_filthiness :integer
#  time_decay_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Event < ApplicationRecord
  belongs_to :time_decay
end
