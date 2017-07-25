FactoryGirl.define do
  factory :user do
    name 'Bharat'
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password 'pw'
  end
end
