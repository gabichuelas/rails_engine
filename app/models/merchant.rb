class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  scope :find_by_attribute, -> (attribute, value) {
    where("merchants.#{attribute}::text ILIKE ?", "%#{value}%")
  }
end
