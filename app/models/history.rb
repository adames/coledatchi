class History < ApplicationRecord
  belongs_to :story
  serialize :results, Hash
end
