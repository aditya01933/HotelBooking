FactoryGirl.define do
  factory :reservation do
    status "MyString"
    checkin_at Date.today.to_s
    checkout_at((Date.today + 2.days).to_s)
    advance 10
    amount 100
  end
end
