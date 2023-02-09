require 'rails_helper'

describe "Search API" do
  before :each do
    load_test_data
  end

  it 'find a single items name which matches a search term' do
    get '/api/v1/items/find?name=ale'

    result = JSON.parse(response.body, symbolize_names: true)
    
    expect(result.count).to eq(1)
    expect(response).to be_successful
    expect(result[:data][:type]).to eq("item")
    expect(result[:data][:attributes]).to have_key(:name)
    expect(result[:data][:attributes]).to have_key(:description)
    expect(result[:data][:attributes]).to have_key(:unit_price)
    expect(result[:data][:attributes]).to have_key(:merchant_id)
    expect(result[:data][:attributes][:name]).to include("Ale")
  end

  it 'finds a single items with min or max price query' do
    get '/api/v1/items/find?min_price=1.00'

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result.count).to eq(1)
    expect(response).to be_successful
    expect(result[:data][:type]).to eq("item")
    expect(result[:data][:attributes]).to have_key(:name)
    expect(result[:data][:attributes]).to have_key(:description)
    expect(result[:data][:attributes]).to have_key(:unit_price)
    expect(result[:data][:attributes]).to have_key(:merchant_id)
    expect(result[:data][:attributes][:unit_price]).to be > 1.00

    get '/api/v1/items/find?max_price=30.00'

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result.count).to eq(1)
    expect(response).to be_successful
   
    expect(result[:data][:type]).to eq("item")
    expect(result[:data][:attributes]).to have_key(:name)
    expect(result[:data][:attributes]).to have_key(:description)
    expect(result[:data][:attributes]).to have_key(:unit_price)
    expect(result[:data][:attributes]).to have_key(:merchant_id)
    expect(result[:data][:attributes][:unit_price]).to be < 30.00
  end

  it 'finds an item from receving both a max price and min price query' do
    get '/api/v1/items/find?max_price=30.00&min_price=10.00'

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result.count).to eq(1)
    expect(response).to be_successful
  #  binding.pry
    expect(result[:data][:type]).to eq("item")
    expect(result[:data][:attributes]).to have_key(:name)
    expect(result[:data][:attributes]).to have_key(:description)
    expect(result[:data][:attributes]).to have_key(:unit_price)
    expect(result[:data][:attributes]).to have_key(:merchant_id)
    expect(result[:data][:attributes][:unit_price]).to be > 10.00
    expect(result[:data][:attributes][:unit_price]).to be < 30.00
  end
  
  it 'returns null object' do
    get '/api/v1/items/find?max_price=1.00'

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result.count).to eq(1)
    expect(response).to be_successful
    # binding.pry
    expect(result[:data]).to eq(nil)
  end
end