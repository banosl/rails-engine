def load_test_data
  Merchant.destroy_all
  Item.destroy_all

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
  @item_12 = create(:item, merchant: @merchant_3)
end