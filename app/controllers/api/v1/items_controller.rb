class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end
#
#   def create
#     merchant = Merchant.create(merchant_params)
#     render json: MerchantSerializer.new(merchant), status: 201
#   end
#
#   def update
#     merchant = Merchant.find(params[:id])
#     merchant.update(merchant_params)
#     render json: MerchantSerializer.new(merchant)
#   end
#
  def destroy
    Item.delete(params[:id])
  end
#
#   private
#
#   def merchant_params
#     params.permit(:name)
#   end
end
