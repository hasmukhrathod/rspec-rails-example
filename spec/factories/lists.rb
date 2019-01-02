FactoryBot.define do
  factory :list do
    name { Faker::Name.first_name }
    slug {Faker::Internet.slug }
  end
end
