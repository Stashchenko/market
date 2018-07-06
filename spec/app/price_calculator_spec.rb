# frozen_string_literal: true

RSpec.describe PriceCalculator do
  let(:item) {Item.new('FR', 'Fruit Tea', 3.11)}
  let(:market) {Market.new}

  it 'sums the prices of the one item' do
    allow(market).to receive(:discount_rules).and_return([])
    price_calculator = PriceCalculator.new(market)
    expect(price_calculator.total({'FR': [item]})).to eq(3.11)
  end

  it 'sums the prices of the two items' do
    allow(market).to receive(:discount_rules).and_return([])
    price_calculator = PriceCalculator.new(market)
    expect(price_calculator.total({'FR': [item, item]})).to eq(6.22)
  end


  it 'sums the prices of with discount' do
    allow(market).to receive(:discount_rules).and_return([OneFreeRule.new('FR')])
    price_calculator = PriceCalculator.new(market)
    expect(price_calculator.total({'FR': [item, item]})).to eq(6.22)
  end
end
