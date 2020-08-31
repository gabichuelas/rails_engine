class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price, :merchant_id
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items 

  before_save :to_dollars

  private
    def to_dollars
      self.unit_price = self.unit_price.fdiv(100)
    end
end
