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
end
