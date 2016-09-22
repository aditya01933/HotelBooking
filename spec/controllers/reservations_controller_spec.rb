require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  
  context "Post #create" do 
    it "should create reservation"
    it "should not create reservation for already reserved room"
  end

  context "GET #index" do
    it 'user should be able to see his reservations'
  end 
end
