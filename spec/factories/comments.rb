FactoryBot.define do
  factory :comment do
    association :post, factory: :post
    body { Faker::Lorem.paragraph(2) }
  end
end
