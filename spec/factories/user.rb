FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { 'a00000' }
    fast_name { "山田" }
    last_name { "太郎" }
    fast_name_kana { "ヤマダ" }
    last_name_kana { "タロウ" }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end