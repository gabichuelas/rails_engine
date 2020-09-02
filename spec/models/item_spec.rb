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

  describe 'class methods' do
    before :each do
      # "Whimsical Nightstand"
      create(:item)
      create(:item, name: "Mid Mod Desk" )
      create(:item, name: "Rustic Desk" )
      create(:item, name: "Desklite 2" )
    end

    it '::find_one' do
      attribute = "name"
      search_value = "desk"
      item = Item.find_one(attribute, search_value)
      expect(item.name.downcase).to include('desk')
    end
  end
end
