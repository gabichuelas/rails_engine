RSpec.describe "Single Finders", type: :request do
  before :each do
    # "Whimsical Nightstand"
    create(:item)
    create(:item, name: "Mid Mod Desk" )
    create(:item, name: "Rustic Desk" )
    create(:item, name: "Desklite 2" )

    # Robin Dean Designs
    create(:merchant)
    create(:merchant, name: "Bikes & More")
    create(:merchant, name: "Atlantic Designs")

    @headers = { "CONTENT_TYPE" => "application/json" }
  end

  describe 'Find Items: returns single record that matches given criteria' do
    it 'can Find for name attribute' do
      get "/api/v1/items/find?name=desk"
      item = JSON.parse(response.body, symbolize_names: true)

      expect(item.count).to eq(1)
      expect(item[:data][:attributes][:name].downcase).to include('desk')

      get "/api/v1/items/find?name=dEsk"
      item = JSON.parse(response.body, symbolize_names: true)

      expect(item.count).to eq(1)
      expect(item[:data][:attributes][:name].downcase).to include('dEsk'.downcase)
    end
  end

  describe 'Find All Items: returns all records that matches given criteria' do
    it 'can Find_all for name attribute' do
      get "/api/v1/items/find_all?name=desk"
      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(3)
      items[:data].each do |item|
        expect(item[:attributes][:name].downcase).to include('desk')
      end

      get "/api/v1/items/find_all?name=dEsk"

      items = JSON.parse(response.body, symbolize_names: true)
      expect(items[:data].count).to eq(3)
      items[:data].each do |item|
        expect(item[:attributes][:name].downcase).to include('desk'.downcase)
      end
    end
  end
end
