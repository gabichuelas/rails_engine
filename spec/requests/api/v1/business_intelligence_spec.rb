RSpec.describe 'Business Intelligence Endpoints' do

  before :each do
    merchantA = create(:merchant, name: "Merchant A")
    @merchantB = create(:merchant, name: "Merchant B")
    merchantC = create(:merchant, name: "Merchant C")

    invoiceA = create(:invoice, merchant: merchantA, updated_at: '2012-03-12')
    invoiceB = create(:invoice, merchant: @merchantB, updated_at: '2012-03-20')
    invoiceC = create(:invoice, merchant: merchantC, updated_at: '2012-03-26')

    create(:payment, invoice: invoiceA)
    create(:payment, invoice: invoiceB)
    create(:payment, invoice: invoiceC)

    3.times do create(:invoice_item, item: create(:item), invoice: invoiceA) end

    2.times do create(:invoice_item, item: create(:item), invoice: invoiceB) end

    create(:invoice_item, item: create(:item), invoice: invoiceC)
  end

  it 'can get x number of merchants ranked by total # of items sold' do
    #
    get "/api/v1/merchants/most_items?quantity=2"
    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data].count).to eq(2)
    expect(merchants[:data][0][:attributes][:name]).to eq("Merchant A")
    expect(merchants[:data][1][:attributes][:name]).to eq("Merchant B")
  end

  it 'can get revenue for a single merchant' do
    # GET /api/v1/merchants/:id/revenue
    get "/api/v1/merchants/#{@merchantB.id}/revenue"
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data][:attributes][:revenue]).to eq(7004.50)
  end

  it 'can get revenue across date range' do
    # GET /api/v1/revenue?start=<start_date>&end=<end_date>
    get '/api/v1/revenue?start=2012-03-09&end=2012-03-24'
    revenue = JSON.parse(response.body, symbolize_names: true)

    expect(revenue[:data][:attributes][:revenue]).to eq(17511.25)
  end

  it 'can get merchants with the most revenue' do
    # GET /api/v1/merchants/most_revenue?quantity=x
    get '/api/v1/merchants/most_revenue?quantity=2'
    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data].count).to eq(2)
    expect(merchants[:data][0][:attributes][:name]).to eq("Merchant A")
    expect(merchants[:data][1][:attributes][:name]).to eq("Merchant B")
  end
end
