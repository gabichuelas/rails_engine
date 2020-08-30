RSpec.describe Item do
  describe 'validations' do
    it { should validate_presence_of :name, :description, :unit_price, :merchant_id }
  end

  describe 'relationships' do
    it { should belong_to :merchant }
  end

  describe 'before_create methods' do
    it 'to_dollars' do
      item_params = {
        name: 'Item Qui Esse',
        description: 'Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.',
        unit_price: 75107,
        merchant_id: 1,
        created_at: '2012-03-27 14:53:59 UTC',
        updated_at: '2012-03-27 14:53:59 UTC'
      }

      item = Item.create(item_params)
      expect(item.unit_price).to eq(751.07)
    end
  end
end
