class Api::V1::Items::SearchController < ApplicationController
  def index
    if params.has_key?(:name)
      results_from_name = Item.where("lower(name) like ?", "%#{params[:name].downcase}%").order(:name).first
      render json: ItemSerializer.new(results_from_name)
    elsif params.has_key?(:min_price) && params.has_key?(:max_price)
      results_from_max_and_min = Item.where("unit_price >= ?", params[:min_price]).where("unit_price <= ?", params[:max_price]).order(:name).first
      render json: ItemSerializer.new(results_from_max_and_min)
    elsif params.has_key?(:min_price) || params.has_key?(:max_price)
      if params.has_key?(:min_price)
          results_from_min = Item.where("unit_price >= ?", params[:min_price]).order(:name).first
          render json: ItemSerializer.new(results_from_min)
      elsif params.has_key?(:max_price)
        results_from_max = Item.where("unit_price <= ?", params[:max_price]).order(:name).first
          render json: ItemSerializer.new(results_from_max)
      end
    end
  end
end