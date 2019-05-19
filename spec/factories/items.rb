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
    
    factory :ladies_item, class: Item do
      name {"ABC"}
      price {"1000"}
      description {"aaaaa"}
      first_category_id {"1"}
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
    end

    factory :mens_item, class: Item do
      name {"ABC"}
      price {"1000"}
      description {"aaaaa"}
      first_category_id {"2"}
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
    end

    factory :baby_item, class: Item do
      name {"ABC"}
      price {"1000"}
      description {"aaaaa"}
      first_category_id {"3"}
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
    end

    factory :interior_item, class: Item do
      name {"ABC"}
      price {"1000"}
      description {"aaaaa"}
      first_category_id {"4"}
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
    end

    factory :nike_item, class: Item do
      name {"ABC"}
      price {"1000"}
      description {"aaaaa"}
      brand_id {"2"}
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
    end

    factory :adidas_item, class: Item do
      name {"ABC"}
      price {"1000"}
      description {"aaaaa"}
      brand_id {"3"}
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
    end

    factory :puma_item, class: Item do
      name {"ABC"}
      price {"1000"}
      description {"aaaaa"}
      brand_id {"4"}
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
    end

  
    factory :reebok_item, class: Item do
      name {"ABC"}
      price {"1000"}
      description {"aaaaa"}
      brand_id {"5"}
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
    end

    factory :converse_item, class: Item do
      name {"ABC"}
      price {"1000"}
      description {"aaaaa"}
      brand_id {"6"}
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
    end
  end
end
