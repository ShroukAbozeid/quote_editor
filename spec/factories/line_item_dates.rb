FactoryBot.define do
  factory :line_item_date do
    quote
    date { Faker::Date.forward(days: rand(1..20)) }
  end
end
