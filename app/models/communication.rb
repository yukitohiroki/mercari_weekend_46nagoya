class Communication < ApplicationRecord
	validates :item_id,:user_id,:order_status_id,presence: true
	belongs_to :item
    belongs_to :user
    belongs_to :order_status
end

