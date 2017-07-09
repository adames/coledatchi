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

class Trait < ApplicationRecord
  belongs_to :pet

end
