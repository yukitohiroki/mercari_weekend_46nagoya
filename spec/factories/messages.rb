FactoryBot.define do
  factory :message do
    message {"aaaa"}
    association :item
    association :user
    association :order_status
  end
end
