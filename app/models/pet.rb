class Pet < ApplicationRecord
  belongs_to :user
  has_many :pet_cares
  has_many :traits
  has_one :time_decay
  has_many :events, through: :time_decay
end
