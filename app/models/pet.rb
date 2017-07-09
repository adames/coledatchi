# == Schema Information
#
# Table name: pets
#
#  id          :integer          not null, primary key
#  name        :string
#  health      :integer          default(10)
#  hunger      :integer          default(0)
#  boredom     :integer          default(0)
#  filthiness  :integer          default(0)
#  user_id     :integer
#  pet_type_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :pet_type
  has_many :pet_cares
  has_many :traits
  has_one :time_decay
  has_many :events, through: :time_decay

  def self.generate_random

  end

end
