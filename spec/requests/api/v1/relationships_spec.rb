RSpec.describe "Api::V1 Item/Merchant relationships", type: :request do
  before :each do
    @merchant = create(:merchant)
    2.times { create(:item, merchant: @merchant) }
    @item = create(:item, merchant: @merchant)
    @headers = { "CONTENT_TYPE" => "application/json" }
  end

  describe 'GET /api/v1/merchants/:id/items' do
    it 'returns all items associated with a merchant' do

      get "/api/v1/merchants/#{@merchant.id}/items"
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(json[:data].count).to eq(3)

      json[:data].each do |item|
        expect(item).to have_key(:id)
        expect(item[:attributes][:merchant_id]).to eq(@merchant.id)
      end
    end
  end

  describe 'GET /api/v1/items/:id/merchant' do
    it 'returns the merchant associated with an item' do

      get "/api/v1/items/#{@item.id}/merchant"
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(json[:data].count).to eq(1)
      expect(json[:data][:id]).to eq(@merchant.id)
    end
  end
end
