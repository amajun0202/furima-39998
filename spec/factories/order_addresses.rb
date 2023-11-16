FactoryBot.define do
  factory :order_address do
    association :user
    association :item
    postal_code { '123-4567' }
    origin_region_id { Faker::Number.between(from: 2, to: 46) }
    city { '東京都' }
    street_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09039383933'}
    token {"tok_abcdefghijk00000000000000000"}
   
  end
end