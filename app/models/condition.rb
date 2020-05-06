class Condition < ApplicationRecord
  belongs_to :product, optional: true
end
