class Item < ApplicationRecord
  has_many :item_images
  has_many :messages
  has_many :likes
  has_many :flags
  has_many :message_users,through::messages,source::user
  has_many :like_users,through::likes,source::user
  has_many :flag_users,through::flags,source::user
  belongs_to :order
  belongs_to :profit
  belongs_to :prefecture
  belongs_to :user
  belongs_to :first_category
  belongs_to :second_category
  belongs_to :third_category
  belongs_to :brand
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_date
  belongs_to :order_status
  belongs_to :size
end
