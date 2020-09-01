class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def create
    merchant = Merchant.create(merchant_params)
    render json: MerchantSerializer.new(merchant), status: 201
  end

  def update
    merchant = Merchant.find(params[:id])
    render json: merchant.update(merchant_params)
  end

  def destroy
    Merchant.delete(params[:id])
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
