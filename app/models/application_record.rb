class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find_one(attribute, value)
    find_by_attribute(attribute, value).first
  end

  def self.find_all(attribute, value)
    find_by_attribute(attribute, value)
  end
end
