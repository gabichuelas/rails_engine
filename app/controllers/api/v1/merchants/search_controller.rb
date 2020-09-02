class Api::V1::Merchants::SearchController < ApplicationController
  def index
    attribute = merchant_params.keys.first
    search_value = merchant_params[attribute].downcase
    merchants = Merchant.where("merchants.#{attribute} ILIKE ?", "%#{search_value}%")
    render json: MerchantSerializer.new(merchants)
  end

  def show
    # refactor this to merchant model at some point, using scope?
    attribute = merchant_params.keys.first
    search_value = merchant_params[attribute].downcase
    merchants = Merchant.where("merchants.#{attribute} ILIKE ?", "%#{search_value}%")
    render json: MerchantSerializer.new(merchants.first)
  end

  private

  def merchant_params
    params.permit(:name, :created_at, :updated_at)
  end
end
