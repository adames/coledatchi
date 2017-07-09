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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
