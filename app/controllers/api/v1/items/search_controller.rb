class Api::V1::Items::SearchController < ApplicationController
  def show
    # require "pry"; binding.pry
    # do query params always show up first in the params hash?
    attribute = item_params.keys.first
    search_value = item_params[attribute].downcase
    # find Item where attribute: includes search_value
    items = Item.where("items.#{attribute} ILIKE ?", "%#{search_value}%")
    render json: ItemSerializer.new(items.first)
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
