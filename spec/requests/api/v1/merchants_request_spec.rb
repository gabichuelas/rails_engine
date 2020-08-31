require 'rails_helper'

RSpec.describe "Api::V1::Merchants", type: :request do

  describe "GET /index" do
    it "returns http success" do

      create_list(:merchant, 5)
      get "/api/v1/merchants/index"

      merchants = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to have_http_status(:success)
      expect(orders[:data].count).to eq(5)
    end
  end

  describe "GET /show" do
    xit "returns http success" do
      get "/api/v1/merchants/show"
      expect(response).to have_http_status(:success)
    end
  end

end
