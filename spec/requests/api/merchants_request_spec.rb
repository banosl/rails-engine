require 'rails_helper'

describe "Merchants API" do
  before :each do
    load_test_data
  end
  it "sends a list of all merchants" do
    get '/api/v1/merchants'

    expect(response).to be_successful
  end
end