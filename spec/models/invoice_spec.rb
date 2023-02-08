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
    it {should have_many(:items).through(:invoice_items)}
  end

  describe "class methods" do
    describe "destroy_empty_invoices" do
      it "can destroy invoices without items" do
        @invoice_10 = create(:invoice, status: "packaged", merchant: @merchant_2, customer: @customer_1)
        expect(Invoice.count).to eq(5)

        expect(@invoice_10.invoice_items).to eq([])
        Invoice.destroy_empty_invoices

        expect(Invoice.count).to eq(4)
      end
    end
  end
end