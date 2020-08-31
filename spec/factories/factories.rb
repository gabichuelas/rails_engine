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
    unit_price { 70045 }
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
