class Api::V1::Items::SearchController < ApplicationController
  def index
    attribute = item_params.keys.first
    search_value = item_params[attribute].downcase
    render json: ItemSerializer.new(Item.find_all(attribute, search_value))
  end

  def show
    attribute = item_params.keys.first
    search_value = item_params[attribute].downcase
    render json: ItemSerializer.new(Item.find_one(attribute, search_value))
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
