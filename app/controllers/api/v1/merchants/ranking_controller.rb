class Api::V1::Merchants::RankingController < ApplicationController
  def most_items_sold
    require "pry"; binding.pry
    result_length = params[:quantity]
  end

  def most_revenue
  end
end
