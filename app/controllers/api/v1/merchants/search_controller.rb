module Api
  module V1
    module Merchants
      class SearchController < ApplicationController
        def index
          if params.has_key?(:name)
            merchants = Merchant.where("lower(name) like ?", "%#{params[:name].downcase}%").order(:name)
            render json: MerchantSerializer.new(merchants)
          end
        end
      end
    end
  end
end