require 'rails_helper'
module Api;module V1
  RSpec.describe AvailableRoomsController, type: :controller do

    context "GET #index" do     

      context 'category given' do
        it 'should not show any room when no room available' do
          params = {checkin_at: Date.today, checkout_at: Date.today + 1, category: "Deluxe Rooms"}
          get :index, params
          expect(response.status).to be 404
        end

        it 'should show room when room available' do
          room = FactoryGirl.create(:room)
          params = {checkin_at: Date.today, checkout_at: Date.today + 1, category: room.category}
          get :index, params
          expect(response.status).to be 200
        end
      end

      context 'when category not given' do
        it 'should show room when room available' do
          room = FactoryGirl.create(:room)
          params = {checkin_at: Date.today, checkout_at: Date.today + 1}
          get :index, params
          expect(response.status).to be 200
        end
      end

    end 

  end  
end;end