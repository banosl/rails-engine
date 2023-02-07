class Api::V1::ItemsController < ApplicationController
  def index
    if params.has_key?(:merchant_id)
      render json: MerchantItemsSerializer.new(Merchant.find(params[:merchant_id]))
    end
  end
end