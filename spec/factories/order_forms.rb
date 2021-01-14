FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '中野区' }
    address { '野方 1-1' }
    building_name { 'テックビル' }
    phone_number { '09012345678' }
    user_id   { 2 }
    item_id   { 5 }
  end
end
