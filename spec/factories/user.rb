FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    encrypted_password { '000000' }
    fast_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    fast_name_kana { "ヤマダ" }
    last_name_kana { "タロウ" }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end