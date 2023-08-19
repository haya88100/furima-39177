FactoryBot.define do
  factory :image do
    content {Faker::Lorem.sentence}
    association :user
    association :item

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end