FactoryBot.define do
  factory :brand_category do
    association :brand,           factory: :brand
    association :first_category,  factory: :first_category
  end
end
