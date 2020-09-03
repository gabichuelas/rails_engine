class Api::V1::Merchants::RankingController < ApplicationController
  def most_items_sold
    merchants = Merchant.rank_by_items_sold(params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end

  def most_revenue
  end
end
