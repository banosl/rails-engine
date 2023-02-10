require 'rails_helper'

RSpec.describe Item, type: :model do
  before :each do
    load_test_data
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :unit_price}
  end

  describe "relationships" do
    it {should belong_to :merchant}
    it {should have_many :invoice_items}
  end

  describe "class methods" do
    it "returns results from a name fragment" do
      query = "ale"
      item2 = create(:item, name: "Splash Down Ale")
      item1 = create(:item, name: "A Apple Ale")

      expect(Item.search_name_fragment(query)).to eq(item1)
    end

    it "returns results from having both min_price, max_price" do
      min = 10
      max = 50

      expect(Item.search_price(min, max).unit_price).to be >= 10
      expect(Item.search_price(min, max).unit_price).to be <= 50
    end

    it "returns results from having just min price" do
      min = 5
      max = nil
      expect(Item.search_price(min, max).unit_price).to be >= 5
    end
    
    it "returns results from having just max price" do
      max = 50
      min = nil
      expect(Item.search_price(min, max).unit_price).to be <= 50
    end
  end
end