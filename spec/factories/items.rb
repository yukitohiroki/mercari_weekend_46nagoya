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
    
    trait :ladies_item, class: Item do
      first_category_id {"1"}
    end

    trait :mens_item, class: Item do
      first_category_id {"2"}
    end

    trait :baby_item, class: Item do
      first_category_id {"3"}
    end

    trait :interior_item, class: Item do
      first_category_id {"4"}
    end

    trait :nike_item, class: Item do
      brand_id {"2"}
    end

    trait :adidas_item, class: Item do
      brand_id {"3"}
    end

    trait :puma_item, class: Item do
      brand_id {"4"}
    end

  
    trait :reebok_item, class: Item do
      brand_id {"5"}
    end

    trait :converse_item, class: Item do
      brand_id {"6"}
    end
  end
end
