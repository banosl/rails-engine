require 'rails_helper'

describe "Search Merchants API" do
  before :each do
    load_test_data
  end

  it 'find all merchants which match a search term' do
    merchant_4 = Merchant.create(name: "Jeffrey")
    merchant_5 = Merchant.create(name: "Jeffles")

    get '/api/v1/merchants/find_all?name=Eff'

    results = JSON.parse(response.body, symbolize_names: true)

    merchants = results[:data]
    merchants.each do |merchant|
      expect(merchant[:attributes]).to have_key(:name)
    end
    expect(merchants[0][:attributes][:name]).to eq("Jeffles")
    expect(merchants[1][:attributes][:name]).to eq("Jeffrey")
  end
end