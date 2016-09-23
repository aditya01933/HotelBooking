require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { is_expected.to validate_presence_of(:checkin_at) }
  it { is_expected.to validate_presence_of(:checkout_at) }

  context "when checkin after checkout" do
    it "should validate checkout after checkin" do
      reservation = FactoryGirl.build(:reservation, checkout_at: Date.today, checkin_at: Date.today + 1)
      expect(reservation).to be_invalid
      expect(reservation.errors[:checkout_at][0]).to include(': Should be greater than checkin date')
    end
  end

  context "when checkin equal to checkout" do
    it "should validate checkout after checkin" do
      reservation = FactoryGirl.build(:reservation, checkout_at: Date.today, checkin_at: Date.today)
      expect(reservation).to be_invalid
      expect(reservation.errors[:checkout_at][0]).to include(': Should be greater than checkin date')
    end
  end

  it "should validate booking before 6 months" do
   reservation = FactoryGirl.build(:reservation, checkout_at: Date.today + 6.months + 2.days, checkin_at: Date.today + 6.months + 1.day)
   expect(reservation).to be_invalid
   expect(reservation.errors[:checkin_at][0]).to include(': Should be less than or equal to 6 months') 
  end

end
