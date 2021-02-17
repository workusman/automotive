require "rails_helper"

describe "Reservations" do
  let(:customer){ FactoryBot.create(:customer) }
  let(:vehicle){ FactoryBot.create(:vehicle) }

  let(:reservation){ FactoryBot.create(:reservation, customer: customer, vehicle: vehicle) }
  describe "CREATE" do
    let(:create_params) {
      {
        reservation: {
          starts_at: Time.now,
          ends_at: Time.now + 1.day,
          vehicle_id: vehicle.id,
          customer_id: customer.id
        }
      }
    }
    it 'CREATE - can create a Reservation' do
      post "/api/v1/reservations", params: create_params
      expect(json["customer"]["name"]).to eq customer.name
      expect(json["vehicle"]["name"]).to eq vehicle.name
    end
  end
  
  describe "DELTE" do
    it 'DELETES - can delete a Reservation' do
      delete "/api/v1/reservations/#{reservation.id}"
      expect(response.status).to eq 200
    end
  end 

  describe "GET" do
    it 'SHOWS - can retreive a Reservation' do
      get "/api/v1/reservations/#{reservation.id}"
      expect(json["customer"]["name"]).to eq customer.name
      expect(json["vehicle"]["name"]).to eq vehicle.name
    end
  end
end
