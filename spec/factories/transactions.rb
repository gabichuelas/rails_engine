FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number { 4654405418249632 }
    result { 1 }
  end
end
