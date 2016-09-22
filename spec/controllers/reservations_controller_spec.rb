require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
    
  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end  

  context "Post #create" do 

    it "should create reservation" do
      room = FactoryGirl.create(:room)

      expect { post :create,reservation: FactoryGirl.attributes_for(:reservation), category: room.category
          }.to change(Reservation, :count).by(1)    
      expect(response).to redirect_to(reservations_path)
      expect(flash[:notice]).to match "Room reservation successful."
    end

    it "should not create reservation for already reserved room" do
      post :create,reservation: FactoryGirl.attributes_for(:reservation), category: "Deluxe Rooms"
      expect(response).to render_template("new")
      expect(assigns(:reservation).errors.messages).to include(:room => ["not available"])
    end
      
  end

  context "GET #index" do
    it 'user should be able to see his reservations'
  end 
end
