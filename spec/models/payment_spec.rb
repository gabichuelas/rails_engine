RSpec.describe Payment, type: :model do
  describe 'validations' do
    it { should validate_presence_of :invoice_id }
    it { should validate_presence_of :credit_card_number }
    # it { should validate_presence_of :credit_card_expiration_date }
    it { should validate_presence_of :result }
  end

  describe 'relationships' do
    it { should belong_to :invoice }
  end

  describe 'before_create methods' do
    it 'to_dollars' do

      item = create(:item)
      item.update(unit_price: 75107)

      expect(item.unit_price).to eq(751.07)
    end
  end
end
