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

  describe "CHECKS OVERLAPS" do
    let(:reservation_2){ FactoryBot.create(:reservation, customer: customer, vehicle: vehicle, starts_at: Time.zone.now, ends_at: Time.zone.now + 1.days ) }
    let(:new_params) {
      {
        reservation: {
          starts_at: reservation_2.starts_at + 3.hours,
          ends_at: reservation_2.ends_at - 3.hours,
          vehicle_id: vehicle.id,
          customer_id: customer.id
        }
      }
    }
    it 'checks for the overlap reservations' do
      post "/api/v1/reservations", params: new_params
      expect(json["exception"]["message"]).to eq "This vehicle is booked for the given time slot"
    end
  end
end
