FactoryGirl.define do
  sequence(:email) { |n| "test#{n}@test.com" }

  factory :user do
    email
    password 'password1'
  end
end
