FactoryBot.define do
  factory :item_image do
    image {"aaa.jpg"}
    association :item
  end    
end
