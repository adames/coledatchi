class User < ApplicationRecord
  has_many :pets
  has_many :pet_cares, through: :pets
end
