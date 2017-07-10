class Pet < ApplicationRecord
  belongs_to :user
  has_one :story
  has_many :events, through: :story

end
