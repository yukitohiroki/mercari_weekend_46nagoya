FactoryBot.define do
  factory :payment_information do
    card_number               { Faker::Number.number(1) }
    valid_year                { Faker::Number.number(1) }
    cvc                       { Faker::Number.number(1) }
    association :user,  factory: :user
  end
end