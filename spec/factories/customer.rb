FactoryBot.define do
  factory :customer do
    name    {Faker::Name.name}
    tel     {Faker::Number.leading_zero_number(digits: 10)}
    time    {Faker::Number.leading_zero_number(digits: 4)}
    people  {Faker::Number.leading_zero_number(digits: 2)}
    text    {Faker::Lorem.sentence}
    day     {Faker::Number.leading_zero_number(digits: 8)}
  end
end