FactoryBot.define do
  factory :second_category do
    second_category {"aaa"}
    association :first_category
    end

  factory :ledies_category, class: :second_category do
    second_category {"aaa"}
    first_category_id {1}
  end
end
