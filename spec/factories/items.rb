FactoryBot.define do
  factory :item do
    association :list, factory: :list
    title { Faker::Lorem.sentence }
    body { "Shit is the Fuck" }
  end
end
