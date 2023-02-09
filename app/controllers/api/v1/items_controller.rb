class Api::V1::ItemsController < ApplicationController
  def index
    if params.has_key?(:merchant_id)
      if Merchant.exists?(params[:merchant_id])
        merchant = Merchant.find(params[:merchant_id])
        render json: ItemSerializer.new(merchant.items)
      # else Merchant.find(params[:merchant_id])
       
      end
    else
      render json: ItemSerializer.new(Item.all)
    end
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    item = Item.create(item_params)
    render json: ItemSerializer.new(item), status: 201
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: ItemSerializer.new(item)
    elsif Merchant.find(params[:merchant_id]) #this line makes the test past in postman because it fails to find a merchant
      # render json: {error: "merchant not found", status: 404}
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    Invoice.destroy_empty_invoices

  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end