RSpec.describe "Api::V1::Merchants", type: :request do
  before :each do
    @merchants = create_list(:merchant, 5)
    @merchant = create(:merchant)
  end

  it 'GET merchants#index' do

    get api_v1_merchants_path
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:success)
    expect(json[:data].count).to eq(6)
    expect(json[:data][0]).to have_key(:id)
    expect(json[:data][0][:attributes]).to have_key(:name)
  end

  it 'GET merchants#show' do

    get api_v1_merchant_path(@merchant.id)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:success)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:attributes]).to have_key(:name)
  end

  it 'DELETE merchants#destroy' do

    merchant_id = create(:merchant).id
    get api_v1_merchant_path(merchant_id)
    json1 = JSON.parse(response.body, symbolize_names: true)

    expect(json1[:data][:id].to_i).to eq(merchant_id)

    delete api_v1_merchant_path(merchant_id)
    json2 = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:success)
    # expect(json2[:data]).to have_key(:id)
    # expect(json2[:data][:attributes]).to have_key(:name)
  end
end
