class Api::V1::Items::SearchController < ApplicationController
  def index
    if params.has_key?(:name) && params.has_key?(:min_price)
      render json: ErrorSerializer.bad_request, status: 400
    elsif params.has_key?(:name) && params.has_key?(:max_price)
      render json: ErrorSerializer.bad_request, status: 400
    elsif params.has_key?(:name)
      results = Item.search_name_fragment(params[:name])
      if results == nil
        render json: ErrorSerializer.no_match
      else
        render json: ItemSerializer.new(results)
      end
    elsif params.has_key?(:min_price) || params.has_key?(:max_price)
      if params[:min_price].to_f >= 0 && params[:max_price].to_f >= 0
        results = Item.search_price(params[:min_price], params[:max_price])
        if results == nil
          render json: ErrorSerializer.no_match
        else
          render json: ItemSerializer.new(results)
        end
      else
        render json: ErrorSerializer.bad_request, status: 400
      end
    end
  end
end