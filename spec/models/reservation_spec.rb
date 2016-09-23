require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { is_expected.to validate_presence_of(:checkin_at) }
  it { is_expected.to validate_presence_of(:checkout_at) }

end
