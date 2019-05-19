FactoryBot.define do
  factory :user do
    nickname   {"hama"}
    first_name {"ishihama"}
    first_name_kana {"イシハマ"}
    last_name {"eri"}
    last_name_kana {"エリ"}
    city {"東海市"}
    address {"加木屋町木之下"}
    password {"eri19880620"}
    encrypted_password {"eri19880620"}
    zip_code {"4770032"}
    birth_year {"1988"}
    birth_month {"6"}
    birth_day {"20"}
    telephone {"11111111"}
    sequence(:email) {Faker::Internet.email}
  end
end
