FactoryBot.define do
  factory :customer do
    name    {Faker::Name.name}
    tel     {Faker::String.random}
    time    {Faker::String.random}
    people  {Faker::String.random}
    text    {Faker::Lorem.sentence}
    day     {Faker::String.random}
  end
end