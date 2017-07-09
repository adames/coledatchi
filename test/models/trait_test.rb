# == Schema Information
#
# Table name: traits
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :string
#  pet_health     :integer
#  pet_hunger     :integer
#  pet_boredom    :integer
#  pet_filthiness :integer
#  pet_id         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class TraitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
