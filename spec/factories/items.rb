FactoryBot.define do

  factory :item do
    name {"ABC"}
    price {"1000"}
    description {"aaaaa"}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    association :prefecture
    association :user
    association :first_category
    association :second_category
    association :third_category
    association :brand
    association :condition
    association :delivery_charge
    association :delivery_date
    association :order_status
    association :size

    after(:build) do |item|
      item.item_images << build(:item_image, item: item)
    end
    end

  factory :ledies_item, class: :item do
    name {"aaa"}
    price {"1000"}
    description {"aaaaa"}
    first_category_id {1}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    association :prefecture
    association :user
    association :second_category
    association :third_category
    association :brand
    association :condition
    association :delivery_charge
    association :delivery_date
    association :order_status
    association :size
  end

  factory :tops_item, class: :item do
    name {"aaa"}
    price {"1000"}
    description {"aaaaa"}
    second_category_id {1}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    association :prefecture
    association :user
    association :first_category
    association :third_category
    association :brand
    association :condition
    association :delivery_charge
    association :delivery_date
    association :order_status
    association :size
  end
end
