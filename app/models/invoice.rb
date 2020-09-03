class Invoice < ApplicationRecord
  validates_presence_of :customer_id
  validates_presence_of :merchant_id
  validates_presence_of :status

  belongs_to :customer
  belongs_to :merchant

  has_many :payments, dependent: :destroy
  has_many :invoice_items
  has_many :items, through: :invoice_items

  scope :revenue_for_range, -> (start_date, end_date) {
    total = joins(:invoice_items, :payments).merge(Payment.success).where(updated_at: Date.parse(start_date).beginning_of_day..Date.parse(end_date).end_of_day).sum("invoice_items.quantity * invoice_items.unit_price")
    Revenue.new(total)
  }
end
