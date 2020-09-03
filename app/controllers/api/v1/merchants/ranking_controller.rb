class Api::V1::Merchants::RankingController < ApplicationController
  def most_items_sold
    result_length = params[:quantity]
    merchants = Merchant.joins(:invoice_items).joins(:payments).select('merchants.*, sum(invoice_items.quantity) as items_sold').where("payments.result = 'success'").group(:id).order('sum(invoice_items.quantity) desc').limit(result_length)
    render json: MerchantSerializer.new(merchants)
  end

  def most_revenue
  end
end
