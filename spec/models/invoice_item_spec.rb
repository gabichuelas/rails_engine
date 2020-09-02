RSpec.describe InvoiceItem do
  describe 'validations' do
    it { should validate_presence_of :item_id }
    it { should validate_presence_of :invoice_id }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
  end

  describe 'relationships' do
    it { should belong_to :item }
    it { should belong_to :invoice }
  end

  # describe 'before_create methods' do
  #   it 'to_dollars' do
  #
  #     invoice_item = create(:invoice_item)
  #     invoice_item.update(unit_price: 75107)
  #
  #     expect(invoice_item.unit_price).to eq(751.07)
  #   end
  # end
end
