# == Schema Information
#
# Table name: time_decays
#
#  id             :integer          not null, primary key
#  last_action    :datetime
#  current_action :datetime
#  pet_id         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class TimeDecayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
