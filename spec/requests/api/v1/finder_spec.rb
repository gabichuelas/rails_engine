RSpec.describe "Single Finders", type: :request do
  before :each do
    # "Whimsical Nightstand"
    create(:item, updated_at: "2012-03-27 12:40:59")
    create(:item, unit_price: 33.27, name: "Mid Mod Desk" )
    create(:item, unit_price: 3.50, name: "Rustic Desk" )
    create(:item, updated_at: "2012-03-27 14:53:59", name: "Desklite 2" )

    # Robin Dean Designs
    create(:merchant)
    create(:merchant, name: "Bikes & More")
    create(:merchant, name: "Atlantic Designs")

    @headers = { "CONTENT_TYPE" => "application/json" }
  end

  describe 'Find Item: returns single record that matches given criteria' do
    it 'can Find for name (string) attribute' do
      get "/api/v1/items/find?name=desk"
      item = JSON.parse(response.body, symbolize_names: true)

      expect(item.count).to eq(1)
      # require "pry"; binding.pry
      expect(item[:data][:attributes][:name].downcase).to include('desk')

      get "/api/v1/items/find?name=dEsk"
      item = JSON.parse(response.body, symbolize_names: true)

      expect(item.count).to eq(1)
      expect(item[:data][:attributes][:name].downcase).to include('dEsk'.downcase)
    end

    it 'can Find for unit_price (integer) attribute' do
      get "/api/v1/items/find?unit_price=3"
      item = JSON.parse(response.body, symbolize_names: true)

      expect(item.count).to eq(1)
      expect(item[:data][:attributes][:unit_price].to_s).to include("3")
    end

    it 'can Find for created/updated_at (DateTime) attribute' do
      get "/api/v1/items/find?updated_at=2012-03-27"
      item = JSON.parse(response.body, symbolize_names: true)

      expect(item.count).to eq(1)
      expect(item[:data][:attributes][:updated_at]).to include("2012-03-27")
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

    it 'can Find_all for unit_price (integer) attribute' do
      get "/api/v1/items/find_all?unit_price=3"
      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(2)
      items[:data].each do |item|
        expect(item[:attributes][:unit_price].to_s).to include('3')
      end
    end

    it 'can Find_all for updated_at (DateTime) attribute' do
      get "/api/v1/items/find_all?updated_at=2012-03-27"
      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(2)
      items[:data].each do |item|
        expect(item[:attributes][:updated_at].to_s).to include('2012-03-27')
      end
    end
  end

  describe 'Find Merchant: returns single record that matches given criteria' do
    it 'can Find for name attribute' do
      get "/api/v1/merchants/find?name=sIgnS"
      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant.count).to eq(1)
      expect(merchant[:data][:attributes][:name].downcase).to include('sIgnS'.downcase)
    end
  end

  describe 'Find All Merchants: returns all records that matches given criteria' do
    it 'can Find_all for name attribute' do
      get "/api/v1/merchants/find_all?name=siGn"
      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(Merchant.count).to eq(7)
      expect(merchants[:data].count).to eq(6)
      merchants[:data].each do |merchant|
        expect(merchant[:attributes][:name].downcase).to include('siGn'.downcase)
      end
    end
  end
end
