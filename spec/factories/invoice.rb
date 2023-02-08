FactoryBot.define do
  factory :invoice do
    association :merchant
    association :customer

    trait :status_shipped do
      shipped {true}
    end
    trait :status_returned do
      returned {true}
    end
    trait :status_packaged do
    packaged {true}
    end
  end
end