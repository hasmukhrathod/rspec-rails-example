FactoryBot.define do
  factory :item do
    association :list, factory: :list
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
