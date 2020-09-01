RSpec.describe "Api::V1::Items", type: :request do
  before :each do
    @items = create_list(:item, 5)
    @item = create(:item)
    @headers = { "CONTENT_TYPE" => "application/json" }
  end

  it 'GET /api/v1/items' do

    get api_v1_items_path
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:success)
    expect(json[:data].count).to eq(6)
    expect(json[:data][0]).to have_key(:id)
    expect(json[:data][0][:attributes]).to have_key(:name)
    expect(json[:data][0][:attributes]).to have_key(:description)
    expect(json[:data][0][:attributes]).to have_key(:unit_price)
    expect(json[:data][0][:attributes]).to have_key(:merchant_id)
  end

  it 'GET /api/v1/items/:id' do

    get api_v1_item_path(@item.id)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:success)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:attributes]).to have_key(:name)
    expect(json[:data][:attributes]).to have_key(:description)
    expect(json[:data][:attributes]).to have_key(:unit_price)
    expect(json[:data][:attributes]).to have_key(:merchant_id)
  end

  it 'DELETE /api/v1/items/:id' do

    item_id = create(:item).id
    get api_v1_item_path(item_id)
    json1 = JSON.parse(response.body, symbolize_names: true)

    expect(json1[:data][:id].to_i).to eq(item_id)

    delete api_v1_item_path(item_id)

    expect(response.status).to eq(204)
    expect(response.body).to eq("")
    expect{Item.find(item_id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'PATCH /api/v1/items/:id' do

    item = create(:item)
    expect(item.name).to eq("Whimsical Nightstand")

    attributes = JSON.generate({name: "New Name", unit_price: 805.00})
    patch api_v1_item_path(item.id), params: attributes, headers: @headers
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(200)
    expect(json[:data][:attributes][:name]).to eq("New Name")
    expect(json[:data][:attributes][:unit_price]).to eq(805.00)

  end

  it 'CREATE /api/v1/items' do

    merchant_id = create(:merchant).id
    attributes = JSON.generate({name: "Mid Mod Desk", description: "This wooden desk has butterflies and copper inserts.", unit_price: 1500.50, merchant_id: merchant_id})
    post api_v1_items_path, params: attributes, headers: @headers
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(201)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:attributes][:name]).to eq("Mid Mod Desk")
    expect(json[:data][:attributes][:description]).to eq("This wooden desk has butterflies and copper inserts.")
    expect(json[:data][:attributes][:unit_price]).to eq(1500.50)
    expect(json[:data][:attributes][:merchant_id]).to eq(merchant_id)
  end
end
