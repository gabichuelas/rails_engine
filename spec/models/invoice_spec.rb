RSpec.describe Invoice do
  describe 'validations' do
    it { should validate_presence_of :customer_id }
    it { should validate_presence_of :merchant_id }
    it { should validate_presence_of :status }
  end

  describe 'relationships' do
    it { should belong_to :customer }
    it { should belong_to :merchant }
  end
end
