FactoryBot.define do
  factory :item do
    name { "Example Item" }
    memo { "Example memo" }
    status_id { 2 }
    chage_bearer_id { 2 }
    shopping_area_id { 2 }
    delivary_day_id { 2 }
    price { 1000 }
    association :user
    category_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end