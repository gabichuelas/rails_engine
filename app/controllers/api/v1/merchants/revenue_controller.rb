class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    # total revenue for one merchant 
    merchant = Merchant.find(params[:id])
    render json: RevenueSerializer.new(merchant.total_revenue)
  end
end
