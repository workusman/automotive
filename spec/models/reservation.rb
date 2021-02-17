require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:customer){ FactoryBot.create(:customer) }
  let(:vehicle){ FactoryBot.create(:vehicle) }

  let(:reservation){ FactoryBot.create(:reservation, customer: customer, vehicle: vehicle) }
  
  describe ".relationships" do
    it 'belongs to customer' do
      expect(reservation.customer).to eq customer
      expect(customer.reservations).to include reservation
    end
  end

  describe "start time and end time" do
    it 'is required and valid' do
      reservation = FactoryBot.build(:reservation, customer: customer, starts_at: nil, ends_at: nil)
      reservation_2 = FactoryBot.build(:reservation, customer: customer, starts_at: Time.now, ends_at: Time.now - 1.day)
      expect(reservation).to_not be_valid
      expect(reservation_2).to_not be_valid
      expect(reservation.errors.messages[:starts_at]).to_not be_blank
      expect(reservation.errors.messages[:ends_at]).to_not be_blank
      expect(reservation_2.errors.messages[:base]).to_not be_blank
    end
  end
end
