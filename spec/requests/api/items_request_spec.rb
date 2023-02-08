require 'rails_helper'

describe "Items API" do
  before :each do
    load_test_data
  end

  it "gets all items" do
    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(items.count).to eq(12)

    items.each do |item|
      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes]).to have_key(:merchant_id)
    end
  end

  it "get one item by id" do
    get "/api/v1/items/#{@item_1.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(item[:attributes]).to have_key(:name)
    expect(item[:attributes][:name]).to be_a(String)
    expect(item[:id]).to eq(@item_1.id.to_s)
    expect(item[:attributes]).to have_key(:description)
    expect(item[:attributes][:description]).to be_a(String)
    expect(item[:attributes]).to have_key(:unit_price)
    expect(item[:attributes][:unit_price]).to be_a(Float)
    expect(item[:attributes]).to have_key(:merchant_id)
  end

  it 'creates an item' do
    item_params = ({
      name: "Night Owl",
      description: "Pumpkin Ale",
      unit_price: 9.55,
      merchant_id: @merchant_1.id
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)
    created_item = Item.last

    expect(response).to be_successful

    expect(created_item.name).to eq(item_params[:name])
    expect(created_item.description).to eq(item_params[:description])
    expect(created_item.unit_price).to eq(item_params[:unit_price])
    expect(created_item.merchant_id).to eq(item_params[:merchant_id])
  end

  it 'updates an item' do
    item_params = ({
      name: "Modus Hoperandi",
      description: "IPA",
      unit_price: 10.55,
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    expect(@item_1.name).to_not eq(item_params[:name])
    expect(@item_1.description).to_not eq(item_params[:description])
    expect(@item_1.unit_price).to_not eq(item_params[:unit_price])

    patch "/api/v1/items/#{@item_1.id}", headers: headers, params: JSON.generate(item: item_params)

    item = Item.find(@item_1.id)
    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
    expect(item.description).to eq(item_params[:description])
    expect(item.unit_price).to eq(item_params[:unit_price])
  end

  it "deletes item" do
    
  end
end
