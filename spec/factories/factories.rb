FactoryBot.define do
  factory :merchant do
    name { "Robin Dean Designs" }
  end
end

FactoryBot.define do
  factory :item do
    merchant
    name { "Whimsical Nightstand" }
    description { "Gorgeous piece of fine woodwork." }
    unit_price { 700.45 }
  end
end

FactoryBot.define do
  factory :customer do
    first_name { "Gaby" }
    last_name { "Mendez" }
  end
end

FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status { "shipped" }
  end
end

FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    quantity { 5 }
    unit_price { 700.45}
  end
end

FactoryBot.define do
  factory :payment do
    invoice
    credit_card_number { "4654405418249632" }
    result { "success" }
  end
end
