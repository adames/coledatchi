# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  pet_owner  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :pets
  has_many :pet_cares, through: :pets

  def adopt (pet)
    self.pets << pet
    self.pet_owner = true
  end

  def pet
    self.pet_owner ? self.pets.last : nil
  end


end
