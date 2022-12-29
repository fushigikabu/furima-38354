FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '大田区' }
    house_number { '蒲田1−1−1' }
    building_name { 'テストビル101' }
    phone_number { 12_345_678_901 }
  end
end
