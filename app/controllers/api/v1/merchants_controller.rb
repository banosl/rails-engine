class Api::V1::MerchantsController < ApplicationController
  def index
    # binding.pry
    render json: MerchantSerializer.new(Merchant.all)
  end
end