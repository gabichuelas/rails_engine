class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    # for a single merchant
    merchant = Merchant.find(params[:id])
    render json: RevenueSerializer.new(merchant.total_revenue)
  end
end
