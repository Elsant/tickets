require "faker"

FactoryGirl.define do
  factory :user do
    email {Faker::Internet.safe_email}
    # sequence(:email) { |n| "user#{n}@example.com" } 
    password "password"
    password_confirmation "password"
    role :user

    trait :agent do
      role :agent
    end

    trait :admin do
      role :admin
    end
  end

  factory :invalid_user, class: User  do
    email nil
    password nil
  end
end