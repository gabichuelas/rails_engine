class Api::V1::RevenueController < ApplicationController
  def index
    # revenue across date range
    start_date = filter_params[:start]
    end_date = filter_params[:end]
    render json: RevenueSerializer.new(Invoice.revenue_for_range(start_date, end_date))
  end

  private

  def filter_params
    params.permit(:start, :end)
  end
end
