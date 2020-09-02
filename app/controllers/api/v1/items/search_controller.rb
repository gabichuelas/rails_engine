class Api::V1::Items::SearchController < ApplicationController
  def index
    attribute = item_params.keys.first
    search_value = item_params[attribute].downcase
    items = Item.where("items.#{attribute} ILIKE ?", "%#{search_value}%")
    render json: ItemSerializer.new(items)
  end

  def show
    # refactor this to item model at some point, using scope?
    attribute = item_params.keys.first
    search_value = item_params[attribute].downcase
    items = Item.where("items.#{attribute} ILIKE ?", "%#{search_value}%")
    render json: ItemSerializer.new(items.first)
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
