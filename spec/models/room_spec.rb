require 'rails_helper'

RSpec.describe Room, type: :model do
  context 'self.find_unreserved' do
    it 'should find unreserved rooms' do
      FactoryGirl.create(:room)
      rooms = Room.find_unreserved Date.today, Date.today+1, "Deluxe Rooms"
      expect(rooms.count).to be 1
    end

    it 'should identify when no rooms are free ' do
      rooms = Room.find_unreserved Date.today, Date.today+1, "Deluxe Rooms"
      expect(rooms.count).to be 0
    end
  end
end
