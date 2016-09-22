FactoryGirl.define do
  factory :reservation do
    status "MyString"
    checkin_at Date.today
    checkout_at(Date.today + 2.days)
    advance 10
    amount 100
  end
end
