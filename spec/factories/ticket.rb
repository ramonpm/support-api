FactoryGirl.define do
  factory :ticket do
    title Faker::Lorem.word
    status Faker::Number.number(0)
    description Faker::Lorem.sentence
  end
end