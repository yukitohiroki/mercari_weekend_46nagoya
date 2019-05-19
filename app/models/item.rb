class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :flags, dependent: :destroy
  has_many :message_users,through: :messages,source: :user
  has_many :like_users,through: :likes,source: :user
  has_many :flag_users,through: :flags,source: :user

  belongs_to :order, optional: true
  belongs_to :profit, optional: true
  belongs_to :prefecture, optional: true
  belongs_to :user, optional: true
  belongs_to :first_category, optional: true
  belongs_to :second_category, optional: true
  belongs_to :third_category, optional: true
  belongs_to :brand, optional: true
  belongs_to :condition, optional: true
  belongs_to :delivery_charge, optional: true
  belongs_to :delivery_date, optional: true
  belongs_to :delivery_way, optional: true
  belongs_to :order_status, optional: true
  belongs_to :size, optional: true

end
