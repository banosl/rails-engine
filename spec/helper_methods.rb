def load_test_data
  Merchant.destroy_all
  Item.destroy_all
  Customer.destroy_all

  @merchant_1 = create(:merchant)
  @merchant_2 = create(:merchant)
  @merchant_3 = create(:merchant)

  @item_1 = create(:item, merchant: @merchant_1)
  @item_2 = create(:item, merchant: @merchant_1)
  @item_3 = create(:item, merchant: @merchant_1)
  @item_4 = create(:item, merchant: @merchant_2)
  @item_5 = create(:item, merchant: @merchant_2)
  @item_6 = create(:item, merchant: @merchant_2)
  @item_7 = create(:item, merchant: @merchant_2)
  @item_8 = create(:item, merchant: @merchant_3)
  @item_9 = create(:item, merchant: @merchant_3)
  @item_10 = create(:item, merchant: @merchant_3)
  @item_11 = create(:item, merchant: @merchant_3)
  @item_12 = create(:item, merchant: @merchant_3, name: "Pickled Ale")

  @customer_1 = create(:customer)
  @customer_2 = create(:customer)
  @customer_3 = create(:customer)


  @invoice_1 = create(:invoice, status: "shipped", merchant: @merchant_1, customer: @customer_1)
  @invoice_2 = create(:invoice, status: "shipped", merchant: @merchant_1, customer: @customer_2)
  @invoice_3 = create(:invoice, status: "shipped", merchant: @merchant_1, customer: @customer_3)
  @invoice_4 = create(:invoice, status: "returned", merchant: @merchant_2, customer: @customer_1)
  
  @invoice_item_1 = create(:invoice_item, invoice: @invoice_1, item: @item_1 )
  @invoice_item_2 = create(:invoice_item, invoice: @invoice_1, item: @item_2 )
  @invoice_item_3 = create(:invoice_item, invoice: @invoice_1, item: @item_3 )
  @invoice_item_4 = create(:invoice_item, invoice: @invoice_2, item: @item_1 )
  @invoice_item_5 = create(:invoice_item, invoice: @invoice_3, item: @item_3 )
  @invoice_item_6 = create(:invoice_item, invoice: @invoice_3, item: @item_1 )
  @invoice_item_7 = create(:invoice_item, invoice: @invoice_4, item: @item_4 )
  @invoice_item_8 = create(:invoice_item, invoice: @invoice_4, item: @item_5 )
end