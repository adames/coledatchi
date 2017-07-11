class Pet < ApplicationRecord
  belongs_to :user
  has_many :events, through: :story

end
