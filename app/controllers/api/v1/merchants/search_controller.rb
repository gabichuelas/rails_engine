class Api::V1::Merchants::SearchController < ApplicationController
  def index
    attribute = merchant_params.keys.first
    search_value = merchant_params[attribute].downcase
    render json: MerchantSerializer.new(Merchant.find_all(attribute, search_value))
  end

  def show
    attribute = merchant_params.keys.first
    search_value = merchant_params[attribute].downcase
    render json: MerchantSerializer.new(Merchant.find_one(attribute, search_value))
  end

  private

  def merchant_params
    params.permit(:name, :created_at, :updated_at)
  end
end
