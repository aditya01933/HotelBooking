FactoryGirl.define do
  factory :user do
    full_name "Test"
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
  end
end