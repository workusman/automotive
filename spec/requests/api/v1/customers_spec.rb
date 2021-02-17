require "rails_helper"

describe "Customers" do
  describe "CREATE" do
    let(:create_params) {
      {
        customer: {
          name: "Usman Asif",
          email: "work.usmanasif@gmail.com",
          phone: "1234567",
        }
      }
    }
    it 'CREATE - can create a customer' do
      post "/api/v1/customers", params: create_params
      expect(Customer.count).to eq 1
      expect(json["name"]).to_not be_nil
      expect(json["name"]).to eq create_params[:customer][:name]
      expect(json["email"]).to eq create_params[:customer][:email]
    end
  end

  describe "Index" do
    let!(:customer){ FactoryBot.create(:customer) }
    it 'INDEX - retreive customers' do
      get "/api/v1/customers"
      expect(json["customers"].count).to eq 1
    end
  end  
end
