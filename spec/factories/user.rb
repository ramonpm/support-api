FactoryGirl.define do
  factory :user do
    first_name Faker::Lorem.word
    last_name Faker::Lorem.word
    admin false
  end
end