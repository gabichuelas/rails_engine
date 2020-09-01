class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def create
    # require "pry"; binding.pry
    render json: Merchant.create(merchant_params), status: 201
  end

  def update
    merchant = Merchant.find(params[:id])
    render json: merchant.update(merchant_params)
  end

  def destroy
    render json: Merchant.delete(params[:id]), status: 204
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name)
  end
end
