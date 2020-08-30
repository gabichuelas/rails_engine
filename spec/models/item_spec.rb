RSpec.describe Item do
  describe 'validations' do
    it { should validate_presence_of :name, :description, :unit_price, :merchant_id }
  end

  describe 'relationships' do
    it { should belong_to :merchant }
  end
end
