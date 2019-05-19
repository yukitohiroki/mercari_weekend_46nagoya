class Size < ApplicationRecord
  belongs_to :size_category, optional: true
  has_many :items
end
