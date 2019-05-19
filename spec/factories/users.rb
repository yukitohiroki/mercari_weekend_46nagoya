FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.name }
    first_name              { Faker::Name.first_name }
    first_name_kana         { Faker::Name.name }
    last_name               { Faker::Name.last_name }
    last_name_kana          { Faker::Name.name }
    city                    { "city" }
    address                 { "address" }
    building                { "building" }
    email                   { Faker::Internet.email }
    encrypted_password      { Faker::Internet.password }
    reset_password_token    { Faker::Internet.password }
    telephone               { "0000" }
    zip_code                { "1234567" }
    birth_year              { "2000" }
    birth_month             { "1" }
    birth_day               { "1" }
    point_amount            { "a" }
    user_icon               { "user_icon" }
    introduction            { "introduction" }
    remember_created_at     { "1" }
    reset_password_sent_at  { "0000" }
    password                { "111111" }
    password_confirmation   { "111111" }
    association :prefecture,           factory: :prefecture
  end
end