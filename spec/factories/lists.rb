FactoryBot.define do
  factory :list do
    name { Faker::Name.first_name }
  end
end
