require 'rails_helper'

describe "Merchants API" do
  before :each do
    load_test_data
  end
  it "sends a list of all merchants" do
    get '/api/v1/merchants'

    expect(response).to be_successful
# binding.pry
    merchants = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(merchants.count).to eq(3)

    merchants.each do |merchant|
      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
    end
  end
end