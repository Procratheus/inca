FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "joe#{n}@feh.com" }
    name 'Joe User'
    password 'password'
  end

  factory :confirmed_user, parent: :user do
    after(:create) { |user| user.confirm! }
  end
end