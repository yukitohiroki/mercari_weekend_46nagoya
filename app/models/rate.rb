class Rate < ApplicationRecord
  has_many :items
  has_many :users
end
