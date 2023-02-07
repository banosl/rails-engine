class Api::V1::MerchantsController < ApplicationController
  def index
    # binding.pry
    render json: Merchant.all.order(:id)
  end
end