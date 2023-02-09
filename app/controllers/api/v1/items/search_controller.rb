module Api
  module V1
    module Items
      class SearchController < ApplicationController
        def index
          if params.has_key?(:name)
            results_from_name = Item.where("lower(name) like ?", "%#{params[:name].downcase}%").order(:name).first
            if results_from_name == nil
              # binding.pry
              render json: {data: results_from_name}
            else
              render json: ItemSerializer.new(results_from_name)
            end
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
    end
  end
end