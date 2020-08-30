FactoryBot.define do
  factory :merchant do
    name { "Merchant Name" }
  end
end

FactoryBot.define do
  factory :item do
    merchant
    name { "Banana" }
    description { "This is an expensive banana." }
    unit_price { 12345 }
  end
end
