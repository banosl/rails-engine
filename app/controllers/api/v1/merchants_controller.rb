class Api::V1::MerchantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_response

  def error_response(error)
    render json: ErrorSerializer.not_found(error), status: 404
  end

  def index
    if params.has_key?(:item_id)
      item = Item.find(params[:item_id])
      render json: MerchantSerializer.new(item.merchant)
    else
      render json: MerchantSerializer.new(Merchant.all)
    end
  end

  def show
      render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end
end