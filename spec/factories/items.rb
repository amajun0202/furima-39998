FactoryBot.define do
  factory :item do
    association :user
    category {Category.all.to_a.reject { |cat| cat.id == 1 }.sample }
    condition { Condition.all.to_a.reject { |cat| cat.id == 1 }.sample }
    shipping_cost { ShippingCost.all.to_a.reject { |cat| cat.id == 1 }.sample }
    origin_region {OriginRegion.all.to_a.reject { |cat| cat.id == 1 }.sample }
    shipping_day { ShippingDay.all.to_a.reject { |cat| cat.id == 1 }.sample }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
    item_name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    cost { Faker::Number.between(from: 300, to: 9_999_999) }

   
  end
end
