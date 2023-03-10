class Api::V1::ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_response

  def error_response(error)
    render json: ErrorSerializer.not_found(error), status: 404
  end
  
  def index
    if params.has_key?(:merchant_id)
      merchant = Merchant.find(params[:merchant_id])
      render json: ItemSerializer.new(merchant.items)
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
    if params[:item].has_key?(:merchant_id)
      Merchant.find(params[:item][:merchant_id])
    end
    if item.update(item_params)
      render json: ItemSerializer.new(item)
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