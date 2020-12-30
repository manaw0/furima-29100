FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials(number: 2) }
    content           { Faker::Lorem.sentence }
    price             { 500 }
    category_id       { 2 }
    status_id         { 2 }
    shipping_fee_id   { 2 }
    prefecture_id     { 2 }
    shipping_day_id   { 2 }
    association :user
  end
end
