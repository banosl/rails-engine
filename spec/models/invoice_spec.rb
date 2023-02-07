require 'rails_helper'

RSpec.describe Invoice, type: :model do
  before :each do
    load_test_data
  end

  describe "validations" do
    it {should validate_presence_of :status}
  end

  describe "relationships" do
    it {should belong_to :customer}
    it {should belong_to :merchant}
    it {should have_many :invoice_items}
  end
end