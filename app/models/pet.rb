class Pet < ApplicationRecord
  belongs_to :user
  has_one :story

end
