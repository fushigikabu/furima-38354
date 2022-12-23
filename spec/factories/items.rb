FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    text { Faker::Lorem.sentence }
    genre_id { Faker::Number.between(from: 2, to: 11) }
    item_condition_id { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    delivery_time_id { Faker::Number.between(from: 2, to: 4) }
    item_price { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
