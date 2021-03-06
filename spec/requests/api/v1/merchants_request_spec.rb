RSpec.describe "Api::V1::Merchants", type: :request do
  before :each do
    @merchants = create_list(:merchant, 5)
    @merchant = create(:merchant)
    @headers = { "CONTENT_TYPE" => "application/json" }
  end

  it 'GET /api/v1/<resource>' do

    get "/api/v1/merchants"
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:success)
    expect(json[:data].count).to eq(6)
    expect(json[:data][0]).to have_key(:id)
    expect(json[:data][0][:attributes]).to have_key(:name)
  end

  it 'GET /api/v1/<resource>/:id' do

    get api_v1_merchant_path(@merchant.id)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:success)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:attributes]).to have_key(:name)
  end

  it 'DELETE /api/v1/<resource>/:id' do

    merchant_id = create(:merchant).id
    get api_v1_merchant_path(merchant_id)
    json1 = JSON.parse(response.body, symbolize_names: true)

    expect(json1[:data][:id].to_i).to eq(merchant_id)

    delete api_v1_merchant_path(merchant_id)

    expect(response.status).to eq(204)
    expect(response.body).to eq("")
    expect{Merchant.find(merchant_id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'PATCH /api/v1/<resource>/:id' do

    merchant = create(:merchant)
    expect(merchant.name).to eq("Robin Dean Designs")

    attributes = JSON.generate({name: "New Name"})
    patch api_v1_merchant_path(merchant.id), params: attributes, headers: @headers
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(200)
    expect(json[:data][:attributes][:name]).to eq("New Name")
  end

  it 'CREATE /api/v1/<resource>' do

    attributes = JSON.generate({name: "University Cobbler"})
    post "/api/v1/merchants", params: attributes, headers: @headers
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(201)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:attributes]).to have_key(:name)
    expect(json[:data][:attributes][:name]).to eq("University Cobbler")
  end
end
