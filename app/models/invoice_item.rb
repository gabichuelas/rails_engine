class InvoiceItem < ApplicationRecord
  validates_presence_of :item_id
  validates_presence_of :invoice_id
  validates_presence_of :quantity
  validates_presence_of :unit_price

  belongs_to :item
  belongs_to :invoice

  before_save :to_dollars

  private
    def to_dollars
      self.unit_price = self.unit_price.fdiv(100)
    end
end
