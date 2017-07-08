FactoryGirl.define do
  factory :ticket do
    title Faker::Lorem.word
    status Ticket::PENDING
    description Faker::Lorem.sentence
  end
end