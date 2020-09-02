class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price, :merchant_id
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :payments, through: :invoices

  scope :find_by_attribute, -> (attribute, value) {
    where("items.#{attribute}::text ILIKE ?", "%#{value}%")
  }

  def self.find_one(attribute, value)
    find_by_attribute(attribute, value).first unless attribute == :date
    # find by date 
  end

  def self.find_all(attribute, value)
    find_by_attribute(attribute, value) unless attribute == :date
    # find by date
  end
end
