class ThirdCategory < ApplicationRecord
  belongs_to :second_category, optional: true
  has_many :users
end
