RSpec.describe Revenue do
  it 'has attributes: id of nil, total' do
    total = 70003.98

    rev = Revenue.new(total)
    expect(rev.revenue).to eq(70003.98)
    expect(rev.id).to eq(nil)
  end
end
