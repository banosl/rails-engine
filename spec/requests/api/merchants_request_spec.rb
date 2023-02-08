require 'rails_helper'

describe "Merchants API" do
  before :each do
    load_test_data
  end

  it "sends a list of all merchants" do
    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(merchants.count).to eq(3)

    merchants.each do |merchant|
      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
    end
  end

  it "returns one merchant based on id" do
    get "/api/v1/merchants/#{@merchant_1.id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(merchant[:attributes]).to have_key(:name)
    expect(merchant[:attributes][:name]).to be_a(String)
    expect(merchant[:id]).to eq(@merchant_1.id.to_s)
  end

  it "returns all items for one merchant based on id" do
    get "/api/v1/merchants/#{@merchant_1.id}/items"

    expect(response).to be_successful

    merchant_items = JSON.parse(response.body, symbolize_names: true)[:data] 

    merchant_items.each do |item|
      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes]).to have_key(:merchant_id)
    end
      
    expect(merchant_items.count).to eq(3)
    # expect(merchant).to have_key(:relationships)
  end
end