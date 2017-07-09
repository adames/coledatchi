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

require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
