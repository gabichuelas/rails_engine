class Item < ApplicationRecord
  validate_presence_of :name, :description, :unit_price, :merchant_id
end
