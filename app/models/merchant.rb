class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  has_many :invoice_items, through: :invoices
  has_many :payments, through: :invoices

  scope :find_by_attribute, -> (attribute, value) {
    where("merchants.#{attribute}::text ILIKE ?", "%#{value}%")
  }

  scope :rank_by_items_sold, -> (result_length) {
    joins(invoices: [:invoice_items, :payments]).where("payments.result = 'success'").group(:id).order('sum(invoice_items.quantity) desc').limit(result_length)
  }

  scope :rank_by_revenue, -> (result_length) {
    joins(invoices: [:invoice_items, :payments]).where("payments.result = 'success'").group(:id).order("sum(invoice_items.unit_price * invoice_items.quantity) desc").limit(result_length)
  }

  def total_revenue
    total = invoice_items.joins(:payments, :invoice).where("payments.result = 'success'").sum("quantity * unit_price")
    Revenue.new(total)
  end
end
