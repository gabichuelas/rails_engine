RSpec.describe Item do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :merchant_id }
  end

  describe 'relationships' do
    it { should belong_to :merchant }
  end

  describe 'before_create methods' do
    it 'to_dollars' do

      item = create(:item)
      item.update(unit_price: 75107)

      expect(item.unit_price).to eq(751.07)
    end
  end
end
