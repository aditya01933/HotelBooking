FactoryGirl.define do
  factory :reservation do
    checkin_at Date.today.to_s
    checkout_at((Date.today + 2.days).to_s)
  end
end
