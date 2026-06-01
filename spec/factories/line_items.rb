FactoryBot.define do
  factory :line_item do
    line_item_date
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    quantity { Faker::Number.between(from: 1, to: 100) }
    unit_price { Faker::Commerce.price(range: 0.01..100.00) }
  end
end
