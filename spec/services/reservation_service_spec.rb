require 'rails_helper'

RSpec.describe ReservationService do

  let(:reservation_params) {FactoryGirl.attributes_for(:reservation)}
  let(:user) {FactoryGirl.create(:user)}
  let(:room) {FactoryGirl.create(:room)}
  let(:category) {room.category}
  let(:reservation_service) {ReservationService.new(reservation_params, user: user, category: category)}
  
  describe '#free_room' do
    it 'should return free room' do  
      expect(reservation_service.free_room).to eq room
    end
  end

  describe '#check_availability_and_confirm' do

    context 'when free room available' do
      it 'should create new reservation' do
        allow(reservation_service).to receive(:free_room).and_return(room)
        expect { reservation_service.check_availability_and_confirm }.to change(Reservation, :count).by(1)
      end
    end

    context 'when free room not available' do
      it 'should add error to reservation object' do
        allow(reservation_service).to receive(:free_room).and_return(nil)
        reservation = reservation_service.check_availability_and_confirm
        expect(reservation.errors[:room][0]).to include('not available')
      end
    end
  end

end