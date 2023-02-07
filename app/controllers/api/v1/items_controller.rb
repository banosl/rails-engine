class Api::V1::ItemsController < ApplicationController
  def index
    if params.has_key?(:merchant_id)
      render json: MerchantItemsSerializer.new(Merchant.find(params[:merchant_id]))
    else
      render json: ItemSerializer.new(Item.all)
    end
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    item = Item.create(new_item_params)
    render json: ItemSerializer.new(item), status: 201
  end

  private
  def new_item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end