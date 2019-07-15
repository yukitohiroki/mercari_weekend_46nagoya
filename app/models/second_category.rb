class SecondCategory < ApplicationRecord
  belongs_to :first_category, optional: true
  belongs_to :size_category, optional: true
  has_many   :third_categories
  has_many   :users
end
