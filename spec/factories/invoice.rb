FactoryBot.define do
  factory :invoice do
    association :merchant
    association :customer
    status
    credit_card_number {Faker::Number.number(digits:16)}
    credit_card_expiration_date {Faker::Date.between(from: '2023-03-01', to: '2030-01-01')}
  end
end