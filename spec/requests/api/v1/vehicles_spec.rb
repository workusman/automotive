require "rails_helper"

describe "Vehicles" do
  describe "CREATE" do
    let(:create_params) {
      {
        vehicle: {
          name: "Test Name",
          make: "Audi",
          model: "A4",
          year: 2019,

        }
      }
    }
    it 'CREATE - can create a vehicle' do
      post "/api/v1/vehicles", params: create_params
      expect(Vehicle.count).to eq 1
      expect(json["name"]).to_not be_nil
      expect(json["name"]).to eq create_params[:vehicle][:name]
      expect(json["model"]).to eq create_params[:vehicle][:model]
    end
  end

  describe "Index" do
    let!(:vehicle){ FactoryBot.create(:vehicle) }
    it 'INDEX - retreive vehicles' do
      get "/api/v1/vehicles"
      expect(json["vehicles"].count).to eq 1
    end
  end  
end
