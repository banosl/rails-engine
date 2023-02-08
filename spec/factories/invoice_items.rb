FactoryBot.define do
  factory :invoice_item do
    association :invoice
    association :item
    quantity {Faker::Number.between(from: 0, to: 550)}
    unit_price {Faker::Number.decimal(l_digits: 2)}
  end
end