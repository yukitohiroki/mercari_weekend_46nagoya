class SecondCategory < ApplicationRecord
  belongs_to :first_category
  belongs_to :size_category
  has_many   :third_categories
end
