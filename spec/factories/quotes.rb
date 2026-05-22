FactoryBot.define do
  factory :quote do
    content { Faker::Quote.famous_last_words }
    company
  end
end
